# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, uniqueness: {scope: :title}

    belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

    has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

    has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy


    # def self.shared_and_owned
    #     Artwork.left_outer_joins(:artwork_shares).where('artworks.artist_id = ? OR artwork_shares.viewer_id = ?', params[:user_id] , params[:user_id])
    # end
end
