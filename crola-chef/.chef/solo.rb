REPO_DIR = File.expand_path "../..", __FILE__
cookbook_path File.join(REPO_DIR, "cookbooks")
data_bag_path File.join(REPO_DIR, "data_bags")
role_path File.join(REPO_DIR, "roles")
solo true