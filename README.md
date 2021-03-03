README
================
Akira Terui
3/2/2021

# Article information

## Title

Three ecological factors influencing riverine fish diversity in the
Shubuto River system, Japan: habitat capacity, habitat heterogeneity and
immigration

## Author

Akira Terui, Yusuke Miyazaki

## Abstract

A major goal of stream ecology is to identify environmental gradients
that shape riverine communities. We examined the relative importance of
three ecological factors that have been hypothesized to influence a
longitudinal pattern of fish diversity: habitat capacity, heterogeneity
and immigration of diadromous fishes. Field surveys were carried out in
the entire network of the Shubuto River system, Hokkaido, Japan. A
hierarchical partitioning approach revealed that distance from the sea,
a proxy for immigration potential of diadromous fishes, had the greatest
explanatory capacity, by which 24.9 % of variation in fish species
richness was explained. Habitat capacity (approximated by catchment
area) was also identified as a significant predictor of fish diversity,
whereas habitat heterogeneity brought little improvement to the model
performance. These results reflect the fish fauna of the Shubuto River
system, in which diadromous fishes are dominant in both abundance and
species richness.

## DOI

<https://doi.org/10.1007/s10201-015-0472-5>

# File description

## Main directory

-   `data_fmt_quad` Formatting quadrat data to estimate habitat
    heterogeneity
-   `data_fmt_site` Formatting site data for variation partitioning

## Subdirectory

-   `/data`

    -   `data_env_quad.csv` Raw quadrat data

        -   site: site ID
        -   date: sampling date
        -   q: quadrat ID
        -   row: row of the quadrat
        -   depth: water depth (cm)
        -   vel: current velocity (cm/s)
        -   silt: percent silt
        -   sand: percent sand
        -   gravel: percent gravel
        -   cobble: percent cobble
        -   bed: percent bedrock

    -   `data_env_site.csv` site-level environmental data

        -   site: site ID
        -   year: sampling year
        -   distance: distance from the sea (m)
        -   cat\_area: catchment area (km<sup>2</sup>)
        -   hull\_area: convex hull area, calculated from PC1 and PC2
            axes of quadrat environmental data (water depth, current
            velocity, substrate score)

    -   `data_fmt_shubuto.csv` Raw fish data

        -   Year: sampling year
        -   StCode: site ID (note: subtle mismatch with environmental
            data)
        -   VisitCode: visit ID - does not matter for this analysis
        -   Genus: genus
        -   LatinName: latin name for the species
        -   Species\_ja: species name in Japanese
        -   Abundance: \# individuals caught
        -   Sample\_area: areal area sampled (sq m)
        -   Lat: latitude (WGS84)
        -   Lon: longitude (WGS84)
        -   Source: irrelevant for this research

    -   `data_heterogeneity.csv` Convex hull area calculated for each
        site

    -   `data_vpart.csv` Data for variation partitioning

        -   StCode: siteID
        -   n\_sp: total species richness
        -   n\_sp\_diad: species richness of diadromous species
        -   n\_sp\_fresh: species richness of strictly freshwater
            species
        -   year: sampling year
        -   distance: distance from the sea (m)
        -   cat\_area: catchment area (km<sup>2</sup>)
        -   hull\_area: convex hull area, calculated from PC1 and PC2
            axes of quadrat environmental data (water depth, current
            velocity, substrate score)
