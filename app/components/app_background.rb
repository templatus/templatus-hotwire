class Components::AppBackground < Components::Base
  def view_template
    svg(
      class: 'fixed inset-0 hidden w-full h-96 drop-shadow-xl lg:block',
      fill: 'none',
      preserveAspectRatio: 'none',
      viewBox: '0 0 100 100',
    ) do |s|
      s.defs do
        s.linearGradient(id: 'grad1', x1: 0, y1: 0, x2: '100%', y2: 0) do
          s.stop(offset: '0%', class: 'gradient__primary')
          s.stop(offset: '30%', class: 'gradient__secondary')
          s.stop(offset: '100%', class: 'gradient__accent')
        end
      end
      s.polygon(fill: 'url(#grad1)', points: '0,0 0,100 100,40 100,0')
    end

    svg(
      class: 'fixed bottom-0 hidden w-full h-96 drop-shadow-xl lg:block',
      fill: 'none',
      preserveAspectRatio: 'none',
      viewBox: '0 0 100 100',
    ) do |s|
      s.defs do
        s.linearGradient(id: 'grad2', x1: 0, y1: 0, x2: '100%', y2: 0) do
          s.stop(offset: '0%', class: 'gradient__primary')
          s.stop(offset: '60%', class: 'gradient__secondary')
          s.stop(offset: '100%', class: 'gradient__accent')
        end
      end
      s.polygon(fill: 'url(#grad2)', points: '0,80 0,100 100,100 100,50')
    end
  end
end
