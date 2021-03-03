
# setup -------------------------------------------------------------------

  pacman::p_load(tidyverse, sp)
  dat0 <- read_csv("data/data_env_quad.csv")

  
# perform pca for habitat heterogeneity -----------------------------------

  dat0 <- dat0 %>% 
    mutate(sub_score = (1 * bed + 2 * silt + 3 * sand + 4 * gravel + 5 * cobble) / 100)
  
  pca <- dat0 %>% 
    select(depth, vel, sub_score) %>% 
    prcomp(scale = T)
  
  dat <- pca$x %>% 
    data.frame() %>% 
    select(PC1, PC2) %>% #select PC1 and PC2
    mutate(site = dat0$site) 
  

# calculate convex hull (a proxy for habitat heterogeneity) ---------------
  
  fun_hullarea <- function(x, y) {
    X <- cbind(x, y)
    point_id <- chull(X)
    hull <- rbind(X[point_id, ], X[point_id[1], ])
    area <- Polygon(hull)@area
    return(area)
  }
  
  hull_area <- dat %>% 
    group_by(site) %>% 
    summarise(hull_area = fun_hullarea(x = PC1, y = PC2))
  
  write_csv(hull_area, 'data/data_heterogeneity.csv')
  
  