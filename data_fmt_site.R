
# setup -------------------------------------------------------------------

  pacman::p_load(tidyverse, hier.part)
  
  diadromous <- c("kawayatsume", "kajika", "kankyoukajika",
                  "shimaukigori", "ukigori", "shirouo",
                  "touyoshi", "mimizu", "ashishiro",
                  "ruriyoshi", "numachichi", "ugui",
                  "yamame", "iwana")
  freshwater <- c("sunayatsume", "funa", "ezougui",
                  "dojou", "fukudojou", "ezohotoke",
                  "tomiyo", "hanakajika" )

  dat_fish	<-	read_csv("data/data_fmt_shubuto.csv") %>% 
    filter(Species_ja != 'ayu') %>% # removed 'ayu' from our analysis because of inefficiency in catching them
    mutate(life_history = case_when(Species_ja %in% diadromous ~ 'diadromous',
                                    Species_ja %in% freshwater ~ 'freshwater'))
  
  dat_env <- read_csv("data/data_env_site.csv") %>% 
    mutate(StCode = case_when(site == 'igarashi' ~ 'igar1',
                              site == 'utasai' ~ 'utasai1',
                              site == 'yunosawa' ~ 'yunosawa1',
                              TRUE ~ as.character(site)))
  

# data formatting ---------------------------------------------------------

  d1 <- dat_fish %>% 
    group_by(StCode) %>% 
    summarise(n_sp = n_distinct(LatinName))
  
  d2 <- dat_fish %>% 
    filter(life_history == 'diadromous') %>% 
    group_by(StCode) %>% 
    summarise(n_sp_diad = n_distinct(LatinName))
    
  d3 <- dat_fish %>% 
    filter(life_history == 'freshwater') %>% 
    group_by(StCode) %>% 
    summarise(n_sp_fresh = n_distinct(LatinName))
  
  dat <- d1 %>% 
    left_join(d2, by = 'StCode') %>% 
    left_join(d3, by = 'StCode') %>% 
    left_join(dat_env, by = 'StCode') %>% 
    drop_na(year) %>% 
    select(-site) %>% 
    mutate(n_sp_fresh = ifelse(is.na(n_sp_fresh), 0, n_sp_fresh))
  
  write_csv(dat, 'data/data_vpart.csv')
  