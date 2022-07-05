module Public::PostsHelper
  #正規表現にヒットする情報を取り出しgsubで変換
  def render_with_tags(article)
    article.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/) { |word| link_to word, "post/tag/:name#{word.delete("#")}",data: {"turbolinks" => false} }.html_safe
  end
end
