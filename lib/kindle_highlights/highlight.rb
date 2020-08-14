module KindleHighlights
  class Highlight
    attr_accessor :asin, :text, :location, :note

    def self.from_html_elements(book:, html_elements:)
      new(
        asin: book.asin,
        text: html_elements.children.search("div.kp-notebook-highlight").first.text.squish,
        location: html_elements.children.search("input#kp-annotation-location").first.attributes["value"].value,
        note: html_elements.children.search("span#note").first.text
      )
    end

    def initialize(asin:, text:, location:, note:)
      @asin = asin
      @text = text
      @location = location
      @note = note
    end

    def to_s
      text
    end
  end
end
