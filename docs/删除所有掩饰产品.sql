# ——————————————————–
# 功能：清空Zen Cart中文版1.3.x的演示数据
# 提醒：请做好备份 !!!
# 使用：管理页面 -> 工具 -> 执行SQL脚本
# ——————————————————–


代码:
# 清空商品分类、商品、属性

TRUNCATE TABLE categories;
TRUNCATE TABLE categories_description;


# 清空商品以及属性

TRUNCATE TABLE media_clips;
TRUNCATE TABLE media_manager;
TRUNCATE TABLE media_to_products;
TRUNCATE TABLE media_types;
TRUNCATE TABLE music_genre;
TRUNCATE TABLE product_music_extra;
TRUNCATE TABLE product_types_to_category;
TRUNCATE TABLE products;
TRUNCATE TABLE products_attributes;
TRUNCATE TABLE products_attributes_download;
TRUNCATE TABLE products_description;
TRUNCATE TABLE products_discount_quantity;
TRUNCATE TABLE products_notifications;
TRUNCATE TABLE products_options;
TRUNCATE TABLE products_options_types;
TRUNCATE TABLE products_options_values;
TRUNCATE TABLE products_options_values_to_products_options;
TRUNCATE TABLE products_to_categories;
TRUNCATE TABLE record_artists;
TRUNCATE TABLE record_artists_info;
TRUNCATE TABLE record_company;
TRUNCATE TABLE record_company_info;


# 清空推荐商品

TRUNCATE TABLE featured;


# 清空促销商品

TRUNCATE TABLE salemaker_sales;


# 清空特价商品

TRUNCATE TABLE specials;


# 清空团体价格

TRUNCATE TABLE group_pricing;


# 清空厂家及资料

TRUNCATE TABLE manufacturers;
TRUNCATE TABLE manufacturers_info;


# 清空客户评论

TRUNCATE TABLE reviews;
TRUNCATE TABLE reviews_description;