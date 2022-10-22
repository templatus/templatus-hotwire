describe('Basic tests', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('can navigate', () => {
    cy.contains('About').click();
    cy.get('main h1').should('contain', 'About');

    cy.contains('Home').click();
    cy.get('main h1').should('contain', 'Hello');
  });

  it('can click', () => {
    cy.get('main h1').should('contain', 'Hello, Templatus!');
    cy.get('#counter').should('contain', '0');

    cy.get('button').click();
    cy.get('#counter').should('contain', '1');
    cy.get('ul').should('contain', '127.0.0.0');
    cy.get('li').should('have.length', 1);
    cy.get('#flash').should('contain', 'successfully');
  });
});
