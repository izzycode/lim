class ParseUrl
  include Interactor

  attr_reader :url, :string_url, :doc

  def call
    @string_url = context.params[:url]
    find_or_create_url 

    context.url = url
  end

  private

  def find_or_create_url
    # we shouldn't parse the url
    # if we already have the record in the DB
    @url = Url.find_by(value: string_url)
    create_and_parse_url unless @url.present?
  end

  def create_and_parse_url
    # This will first check that the url is openable.
    # It can happen either the url passed is incorrect
    # (i.e. invalidurl.asdawew) or also is correctly on syntax,
    # but the url isn't alive (i.e. http://www.asdasdasd.com)

    validate_live_url

    @url = Url.new(value: string_url)
    if @url.save
      parse_url
    else
      context.fail!(error: @url.errors)
    end
  end

  def validate_live_url
    begin
      @doc = Nokogiri::HTML(open(string_url, 'User-Agent' => 'ruby'))
    rescue
      context.fail!(
        error: [
          description: "There was an error parsing the url. Make sure the website is live."
        ])
    end
  end

  def parse_url
    tags = {
      h1: doc.css('h1'),
      h2: doc.css('h2'),
      h3: doc.css('h3'),
      link: doc.css('a')
    }

    tags.each do |tag, values|
      values.each do |value|
        if tag == :link
          next unless valid_url? value['href']
          url.tags.create(name: tag.to_s, content: value['href'])
        else
          url.tags.create(name: tag.to_s, content: value.text)
        end
      end
    end
  end

  protected

  def valid_url? url
    # only web valid urls, with http:// or https://
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
