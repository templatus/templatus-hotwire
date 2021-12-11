import { defineStore } from 'pinia';
import { createConsumer, Subscription } from '@rails/actioncable';
import { get, post } from '@rails/request.js';

export type Click = {
  id: number;
  created_at: string;
  ip: string;
  user_agent: string;
};

let channel: Subscription | null = null;

export const useClickStore = defineStore('click', {
  state: () => ({
    loaded: false,
    subscribed: false,
    total: 0,
    items: [] as Click[],
  }),

  actions: {
    async sendClick() {
      await post('/clicks').catch((err: Error) => alert(err));
    },

    async getClicks() {
      const response = await get('/clicks', {
        responseKind: 'json',
      });
      const json = await response.json;

      this.total = json.total;
      this.items = json.items;
      this.loaded = true;
    },

    subscribe() {
      channel = createConsumer().subscriptions.create(
        {
          channel: 'ClicksChannel',
        },
        {
          received: (click: Click) => {
            this.total += 1;
            this.items.unshift(click);
          },
        },
      );
      this.subscribed = true;
    },

    unsubscribe() {
      if (channel) {
        channel.unsubscribe();
        channel.consumer.disconnect();
      }
      this.subscribed = false;
    },
  },
});
