-- Seed data: existing companionships and assignments from the spreadsheet.
-- Run this AFTER schema.sql, ONCE, on a fresh database.
-- Re-running will create duplicates.

begin;

-- Companionship: Brecheisen, Oliver & Johnson, Kevin Ornal
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Brecheisen, Oliver', 'm_brecheisen_oliver', false),
  ((select id from new_comp), 'Johnson, Kevin Ornal', 'm_johnson_kevin_ornal', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Giddens', 'h_giddens', false),
  ((select id from new_comp), 'Hernandez', 'h_hernandez', false),
  ((select id from new_comp), 'Wilcken', 'h_wilcken', false);

-- Companionship: Brooks, Greg & Brooks, Simeon
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Brooks, Greg', 'm_brooks_greg', false),
  ((select id from new_comp), 'Brooks, Simeon', 'm_brooks_simeon', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Leseberg', 'h_leseberg', false);

-- Companionship: Brown, Kent
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Brown, Kent', 'm_brown_kent', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Barlow', 'h_barlow', false),
  ((select id from new_comp), 'Cook', 'h_cook', false),
  ((select id from new_comp), 'Fullmer (J)', 'h_fullmer_j', false);

-- Companionship: Brush, Kirk & Brush, Sue Ann
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Brush, Kirk', 'm_brush_kirk', false),
  ((select id from new_comp), 'Brush, Sue Ann', 'm_brush_sue_ann', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Getz', 'h_getz', false),
  ((select id from new_comp), 'Gillman', 'h_gillman', false),
  ((select id from new_comp), 'Ray', 'h_ray', false);

-- Companionship: Castaneda, Nico
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Castaneda, Nico', 'm_castaneda_nico', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Lawrence', 'h_lawrence', false);

-- Companionship: Catterson, Tyler & Taylor, Jorie
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Catterson, Tyler', 'm_catterson_tyler', false),
  ((select id from new_comp), 'Taylor, Jorie', 'm_taylor_jorie', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Forbes', 'h_forbes', false),
  ((select id from new_comp), 'Green', 'h_green', false);

-- Companionship: Dicks, Adam
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Dicks, Adam', 'm_dicks_adam', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Barker', 'h_barker', false);

-- Companionship: Hernandez, Jacob & Rogers, Hunter
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Hernandez, Jacob', 'm_hernandez_jacob', false),
  ((select id from new_comp), 'Rogers, Hunter', 'm_rogers_hunter', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Black', 'h_black', false),
  ((select id from new_comp), 'Brimhall', 'h_brimhall', false);

-- Companionship: Johns, Nicole & Johns, Shane
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Johns, Nicole', 'm_johns_nicole', false),
  ((select id from new_comp), 'Johns, Shane', 'm_johns_shane', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Ellinger', 'h_ellinger', false),
  ((select id from new_comp), 'King', 'h_king', false);

-- Companionship: Johnson, Shaun & Quigley, Sean Robert
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Johnson, Shaun', 'm_johnson_shaun', false),
  ((select id from new_comp), 'Quigley, Sean Robert', 'm_quigley_sean_robert', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Ollerton', 'h_ollerton', false),
  ((select id from new_comp), 'Breyer', 'h_breyer', false),
  ((select id from new_comp), 'Tew', 'h_tew', false);

-- Companionship: Kaiser, Jory
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Kaiser, Jory', 'm_kaiser_jory', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Castro', 'h_castro', false),
  ((select id from new_comp), 'Catterson', 'h_catterson', false);

-- Companionship: Lawrence, Cristina & Lawrence, Jonathan
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Lawrence, Cristina', 'm_lawrence_cristina', false),
  ((select id from new_comp), 'Lawrence, Jonathan', 'm_lawrence_jonathan', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Johns', 'h_johns', false),
  ((select id from new_comp), 'Webb', 'h_webb', false),
  ((select id from new_comp), 'Larsen', 'h_larsen', false);

-- Companionship: Smith, Michael
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 1', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Smith, Michael', 'm_smith_michael', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Fullmer (M)', 'h_fullmer_m', false);

-- Companionship: Anderson, Alan & Damiano, Marcelo
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Anderson, Alan', 'm_anderson_alan', false),
  ((select id from new_comp), 'Damiano, Marcelo', 'm_damiano_marcelo', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Brown', 'h_brown', false),
  ((select id from new_comp), 'Newton', 'h_newton', false),
  ((select id from new_comp), 'Young', 'h_young', false);

-- Companionship: Barker, Aaron & Barker, Daniel
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Barker, Aaron', 'm_barker_aaron', false),
  ((select id from new_comp), 'Barker, Daniel', 'm_barker_daniel', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Dyches', 'h_dyches', false),
  ((select id from new_comp), 'Tipton', 'h_tipton', false);

-- Companionship: Breyer, Joshua Ray & Hastain, Tyler Daniel
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Breyer, Joshua Ray', 'm_breyer_joshua_ray', false),
  ((select id from new_comp), 'Hastain, Tyler Daniel', 'm_hastain_tyler_daniel', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Davis (B)', 'h_davis_b', false),
  ((select id from new_comp), 'Davis (L)', 'h_davis_l', false),
  ((select id from new_comp), 'Rogers', 'h_rogers', false);

-- Companionship: Castro, Lui & Catterson, Braiden
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Castro, Lui', 'm_castro_lui', false),
  ((select id from new_comp), 'Catterson, Braiden', 'm_catterson_braiden', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Daines', 'h_daines', false),
  ((select id from new_comp), 'Pectol', 'h_pectol', false);

-- Companionship: Fullmer, Jarrett & Walker, Preston
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Fullmer, Jarrett', 'm_fullmer_jarrett', false),
  ((select id from new_comp), 'Walker, Preston', 'm_walker_preston', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Herbert', 'h_herbert', false),
  ((select id from new_comp), 'Smallcomb (T)', 'h_smallcomb_t', false);

-- Companionship: Gillman, Brandon & Gillman, Ingrid
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Gillman, Brandon', 'm_gillman_brandon', false),
  ((select id from new_comp), 'Gillman, Ingrid', 'm_gillman_ingrid', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Fernandez', 'h_fernandez', false),
  ((select id from new_comp), 'Wilkes', 'h_wilkes', false);

-- Companionship: Herbert, Derren & Roberts, Ryan Boyd
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Herbert, Derren', 'm_herbert_derren', false),
  ((select id from new_comp), 'Roberts, Ryan Boyd', 'm_roberts_ryan_boyd', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Anderson', 'h_anderson', false),
  ((select id from new_comp), 'Meyer', 'h_meyer', false);

-- Companionship: Jensen, Michael & Wing, Michael
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Jensen, Michael', 'm_jensen_michael', false),
  ((select id from new_comp), 'Wing, Michael', 'm_wing_michael', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Fullmer (Mc)', 'h_fullmer_mc', false),
  ((select id from new_comp), 'Stewart', 'h_stewart', false);

-- Companionship: Leseberg, Dan & Pedersen, Mark
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Leseberg, Dan', 'm_leseberg_dan', false),
  ((select id from new_comp), 'Pedersen, Mark', 'm_pedersen_mark', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Brooks', 'h_brooks', false),
  ((select id from new_comp), 'Dicks', 'h_dicks', false),
  ((select id from new_comp), 'Posadas', 'h_posadas', false);

-- Companionship: Meraz, Michael & Renfro, Kevin
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Meraz, Michael', 'm_meraz_michael', false),
  ((select id from new_comp), 'Renfro, Kevin', 'm_renfro_kevin', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Hastain', 'h_hastain', false),
  ((select id from new_comp), 'Quigley', 'h_quigley', false);

-- Companionship: Meyer, Eric & Sommer, Orin Nathaniel
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Meyer, Eric', 'm_meyer_eric', false),
  ((select id from new_comp), 'Sommer, Orin Nathaniel', 'm_sommer_orin_nathaniel', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Kaiser', 'h_kaiser', false),
  ((select id from new_comp), 'Walker', 'h_walker', false);

-- Companionship: Michaelis, Collin & Michaelis, Jeffrey
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Michaelis, Collin', 'm_michaelis_collin', false),
  ((select id from new_comp), 'Michaelis, Jeffrey', 'm_michaelis_jeffrey', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Cardoza', 'h_cardoza', false),
  ((select id from new_comp), 'Kelly', 'h_kelly', false);

-- Companionship: Michaelis, Ross & Sierra, Johnny
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Michaelis, Ross', 'm_michaelis_ross', false),
  ((select id from new_comp), 'Sierra, Johnny', 'm_sierra_johnny', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Bourgeous', 'h_bourgeous', false),
  ((select id from new_comp), 'Lee', 'h_lee', false),
  ((select id from new_comp), 'Peterson', 'h_peterson', false);

-- Companionship: Pectol, Alec
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Pectol, Alec', 'm_pectol_alec', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Michaelis', 'h_michaelis', false);

-- Companionship: Rockwood, David & Rockwood, Eric
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Rockwood, David', 'm_rockwood_david', false),
  ((select id from new_comp), 'Rockwood, Eric', 'm_rockwood_eric', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Catterson', 'h_catterson', false),
  ((select id from new_comp), 'Jones', 'h_jones', false),
  ((select id from new_comp), 'Thorn', 'h_thorn', false),
  ((select id from new_comp), 'Wilmas', 'h_wilmas', false);

-- Companionship: Stauffer, Cal & Stauffer, Casey
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Stauffer, Cal', 'm_stauffer_cal', false),
  ((select id from new_comp), 'Stauffer, Casey', 'm_stauffer_casey', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Seager', 'h_seager', false),
  ((select id from new_comp), 'Kuder', 'h_kuder', false),
  ((select id from new_comp), 'Hill', 'h_hill', false),
  ((select id from new_comp), 'Smallcomb (Td)', 'h_smallcomb_td', false);

-- Companionship: Smallcomb, Ty & Stewart, Joe
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', true)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Smallcomb, Ty', 'm_smallcomb_ty', false),
  ((select id from new_comp), 'Stewart, Joe', 'm_stewart_joe', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Johnson (S)', 'h_johnson_s', false),
  ((select id from new_comp), 'Kuder', 'h_kuder', false),
  ((select id from new_comp), 'Roberts (C)', 'h_roberts_c', false),
  ((select id from new_comp), 'Valdez (S)', 'h_valdez_s', true),
  ((select id from new_comp), 'Valdez', 'h_valdez', false);

-- Companionship: Jones, Derek & Wilcken, Joseph
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', true)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Jones, Derek', 'm_jones_derek', true),
  ((select id from new_comp), 'Wilcken, Joseph', 'm_wilcken_joseph', true)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Hyatt', 'h_hyatt', true),
  ((select id from new_comp), 'Michaelis', 'h_michaelis', false);

-- Companionship: Pedersen, Mark
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Pedersen, Mark', 'm_pedersen_mark', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Pedersen', 'h_pedersen', false);

-- Companionship: Renfro, Kevin
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 2', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Renfro, Kevin', 'm_renfro_kevin', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Meraz', 'h_meraz', false);

-- Companionship: Brimhall, Ben & Hyatt, Aaron
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Brimhall, Ben', 'm_brimhall_ben', false),
  ((select id from new_comp), 'Hyatt, Aaron', 'm_hyatt_aaron', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Johnson (K)', 'h_johnson_k', false);

-- Companionship: Cardoza, Adam & Catterson, Austin
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', true)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Cardoza, Adam', 'm_cardoza_adam', false),
  ((select id from new_comp), 'Catterson, Austin', 'm_catterson_austin', true)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Taylor', 'h_taylor', false),
  ((select id from new_comp), 'Teshima', 'h_teshima', false);

-- Companionship: Catterson, Anthony & Michelsen, David
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Catterson, Anthony', 'm_catterson_anthony', false),
  ((select id from new_comp), 'Michelsen, David', 'm_michelsen_david', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Bennett', 'h_bennett', false),
  ((select id from new_comp), 'Rockwood', 'h_rockwood', false),
  ((select id from new_comp), 'Stauffer', 'h_stauffer', false);

-- Companionship: Cook, Nathan
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Cook, Nathan', 'm_cook_nathan', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Hunter', 'h_hunter', false),
  ((select id from new_comp), 'Renfro', 'h_renfro', false);

-- Companionship: Curtis, Ty & Dreyer, Cody Allen
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Curtis, Ty', 'm_curtis_ty', false),
  ((select id from new_comp), 'Dreyer, Cody Allen', 'm_dreyer_cody_allen', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Powell', 'h_powell', false),
  ((select id from new_comp), 'Turk', 'h_turk', false);

-- Companionship: Daines, Joseph Gordon & Valdez, Jose
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Daines, Joseph Gordon', 'm_daines_joseph_gordon', false),
  ((select id from new_comp), 'Valdez, Jose', 'm_valdez_jose', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Damiano', 'h_damiano', false),
  ((select id from new_comp), 'Jensen', 'h_jensen', false),
  ((select id from new_comp), 'Lindsay', 'h_lindsay', false);

-- Companionship: Hill, Jeffrey Von & McLeroy, Mark
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Hill, Jeffrey Von', 'm_hill_jeffrey_von', false),
  ((select id from new_comp), 'McLeroy, Mark', 'm_mcleroy_mark', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Wing (M)', 'h_wing_m', false),
  ((select id from new_comp), 'Witham (C)', 'h_witham_c', false),
  ((select id from new_comp), 'Witham (J)', 'h_witham_j', false),
  ((select id from new_comp), 'Dreyer', 'h_dreyer', false),
  ((select id from new_comp), 'Weight', 'h_weight', false);

-- Companionship: Bennett, John & Roberts, Carter
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Bennett, John', 'm_bennett_john', false),
  ((select id from new_comp), 'Roberts, Carter', 'm_roberts_carter', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Chase', 'h_chase', false),
  ((select id from new_comp), 'Smith', 'h_smith', false),
  ((select id from new_comp), 'Wing (B)', 'h_wing_b', false);

-- Companionship: Bourgeous, Grant & Forbes, Bill
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Bourgeous, Grant', 'm_bourgeous_grant', false),
  ((select id from new_comp), 'Forbes, Bill', 'm_forbes_bill', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Michelsen', 'h_michelsen', false),
  ((select id from new_comp), 'Sierra', 'h_sierra', false);

-- Companionship: Knudsen, Bill & Knudsen, Karin
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Knudsen, Bill', 'm_knudsen_bill', false),
  ((select id from new_comp), 'Knudsen, Karin', 'm_knudsen_karin', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Hogan', 'h_hogan', false);

-- Companionship: Nelson, Jason Delos
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Nelson, Jason Delos', 'm_nelson_jason_delos', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Nelson', 'h_nelson', false);

-- Companionship: Posadas, Jimmy & Smallcomb, Tad
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Posadas, Jimmy', 'm_posadas_jimmy', false),
  ((select id from new_comp), 'Smallcomb, Tad', 'm_smallcomb_tad', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Black (J)', 'h_black_j', false),
  ((select id from new_comp), 'Marshall', 'h_marshall', false),
  ((select id from new_comp), 'McNalley', 'h_mcnalley', false);

-- Companionship: Ray, Regan & Ray, Vanessa
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', true)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Ray, Regan', 'm_ray_regan', false),
  ((select id from new_comp), 'Ray, Vanessa', 'm_ray_vanessa', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Bailey', 'h_bailey', true),
  ((select id from new_comp), 'Brush', 'h_brush', true);

-- Companionship: Tew, Jeremy & Tew, Jonathan
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Tew, Jeremy', 'm_tew_jeremy', false),
  ((select id from new_comp), 'Tew, Jonathan', 'm_tew_jonathan', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Bohnstedt', 'h_bohnstedt', false),
  ((select id from new_comp), 'Wright', 'h_wright', false);

-- Companionship: Thorn, Landon & Tipton, Brett
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Thorn, Landon', 'm_thorn_landon', false),
  ((select id from new_comp), 'Tipton, Brett', 'm_tipton_brett', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Castaneda', 'h_castaneda', false),
  ((select id from new_comp), 'Chow', 'h_chow', false);

-- Companionship: Turk, Seth & Weaver, Easton
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Turk, Seth', 'm_turk_seth', false),
  ((select id from new_comp), 'Weaver, Easton', 'm_weaver_easton', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'McLeroy', 'h_mcleroy', false),
  ((select id from new_comp), 'Melander', 'h_melander', false);

-- Companionship: Webb, Lynnette & Webb, Merrill
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Webb, Lynnette', 'm_webb_lynnette', false),
  ((select id from new_comp), 'Webb, Merrill', 'm_webb_merrill', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Hullinger', 'h_hullinger', false),
  ((select id from new_comp), 'Kiser', 'h_kiser', false),
  ((select id from new_comp), 'Shick', 'h_shick', false);

-- Companionship: Young, Frank Elling
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', false)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Young, Frank Elling', 'm_young_frank_elling', false)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Sommer', 'h_sommer', false),
  ((select id from new_comp), 'Villar', 'h_villar', false),
  ((select id from new_comp), 'Weaver', 'h_weaver', false);

-- Companionship: Wright, Adam
with new_comp as (
  insert into companionships (district, needs_replacement)
  values ('District 3', true)
  returning id
)
, member_insert as (
  insert into companionship_members (companionship_id, assignee_name, assignee_id, is_missing)
  values
  ((select id from new_comp), 'Wright, Adam', 'm_wright_adam', true)
  returning 1
)
insert into companionship_households (companionship_id, household_name, household_id, is_missing)
values
  ((select id from new_comp), 'Hogan', 'h_hogan', false),
  ((select id from new_comp), 'Knudsen', 'h_knudsen', false);

commit;
