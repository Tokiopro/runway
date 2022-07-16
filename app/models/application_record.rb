class ApplicationRecord < ActiveRecord::Base
    #ActiveRecord::Base を継承したクラスPostFormモデルを作成したので、
    #Rails PotsFormテーブルを自動的に探そうとします。実際にはないので、
    #ActiveRecord::StatementInvalid: Could not find table 'animals' というエラーが発生する。
    #下記のクラスメソッドを記述すれば、エラーが解消できる。
  self.abstract_class = true
end
