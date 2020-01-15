town = Town.new({"id"=>1, "name"=>"平原", "country_id"=>1, "farmer"=>10000, "allegiance"=>100, "agriculture"=>800, "commerce"=>800, "technology"=>800, "wall"=>800, "wall_durability"=>800, "created_at"=>nil, "updated_at"=>nil})
town.save
user = User.new({"id"=>1, "character_id"=>"soyu", "password_digest"=>"hoge", "name"=>"醤油", "image_path"=>"1", "strength"=>12, "strength_exp"=>0, "intelligence"=>30, "intelligence_exp"=>0, "leadership"=>98, "leadership_exp"=>0, "charm"=>214, "charm_exp"=>0, "soldier_type"=>0, "soldier_num"=>0, "training"=>100, "country_id"=>1, "gold"=>1000, "rice"=>1000, "contributing"=>1000, "rank"=>10000, "arm"=>8, "guard"=>37, "book"=>6, "flag"=>16, "delete_turn"=>48, "town_id"=>1, "email"=>"hoge", "created_at"=>nil, "updated_at"=>nil})
user.save
game = Game.new({"id"=>1, "period"=>1, "year"=>200, "month"=>1, "created_at"=>nil, "updated_at"=>nil})
game.save