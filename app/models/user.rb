class User < ApplicationRecord
  attr_accessor :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest
  has_secure_password

  validates :name, presence: true
  validates :password, presence: true, length: {minimum: 4}
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: %w(芸人 スタッフ) }

  has_many :participations, class_name: "Relationship", foreign_key: "participation_id"
  has_many :lives
  has_many :staffs
  belongs_to :main_unit, class_name: "Unit", foreign_key: "main_unit_id", optional: true

  scope :belongs_unit, -> { participations.map(&:solicitation) }

  

  def authenticated?(activation_token)
    return false if activation_digest.nil?
  # activation_digestとactication_tokenが一致していたらtrueを返す。
    BCrypt::Password.new(activation_digest).is_password?(activation_token)
  end

  private

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # メールアドレスをすべて小文字にする
  def downcase_email
    self.email = email.downcase
  end

  # 有効化トークンとダイジェストを作成および代入する
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
    
  # def self.member(id)
  #   find(id)
    # find(Relationship.where(solicitation_id: id).map(&:participation_id)).map(&:name)
  # end

end
