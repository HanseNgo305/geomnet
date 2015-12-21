#' Bike sharing network (directed)
#'
#' This network is a summary of the bike trips taken by customers of the bike sharing company Capital Bikeshare (\url{https://secure.capitalbikeshare.com/}) during the second quarter of 2015.
#' Only trips between stations in the vicinity of Rockville, MD, are included.
#' The data is organized as a list of two datasets, vertices (stations) and edges (trips between stations),
#' as follows:
#'
#' @references \url{https://secure.capitalbikeshare.com/}
#' @format A list of two data frames:
#' \itemize{
#' \item the trips data set consists of six variables of length 53:
#' \itemize{
#'   \item Start.station: Station where bike trip starts
#'   \item End.station: Station where bike trip ends
#'   \item n: Number of trips between the two stations
#'   \item minlength: Duration of shortest trip between the two stations (in seconds).Only those stations are included, if the shortest trip between them lasted not more than 15 minutes.
#' }
#' \item the vertices data set consists of 16 variables with information on 21 stations:
#' \itemize{
#'   \item id: Station ID number
#'   \item name: Station name
#'   \item lat: Latitude of station location
#'   \item long: Longitude of station location
#'   \item nbDocks: Number of bike docks at the station
#' }
#' }
"bikes"

#' Network of blood types (directed)
#'
#' A list of two datasets, vertices and edges, containing information on blood type (see \url{http://www.redcrossblood.org/learn-about-blood/blood-types}).
#' The variables are as follows:
#'
#' @format A list of two data frames:
#' \itemize{
#' \item the edges data set consists of three variables of length 27:
#' \itemize{
#'   \item from, to factor variables of blood types describing the relationship 'is compatible with'
#'   \item group_to factor variable with levels 'same' and 'diff' for same or different blood type group not regarding the rho-gam factor.
#' }
#' \item the vertices data set consists of five variables and 32 rows:
#' \itemize{
#'   \item label factor variable of blood types,
#'   \item type factor variable of blood type, not regarding the rhesus factor,
#'   \item rho factor variable: 'pos' and 'neg' describing the rhesus factor,
#'   \item Ethnicity factor variable of four variables: 'Caucasians', 'African.American', 'Hispanic', and 'Asian',
#'   \item Predominance numeric variable consisting of the percentage points of each blood type within each ethnicity.
#' }
#' }
"blood"

#' Email network (directed)
#'
#' A list of two datasets, vertices and edges, containing data on employees and (fictitious)
#' email headers from two weeks of internal GAStech company email between employees made available as part of the VAST challenge 2014 (K. Cook, G. Grinstein, M. Whiting, see \url{http://hcil2.cs.umd.edu/newvarepository/benchmarks.php}).
#' The variables are as follows:
#'
#' @format A list of two data frames:
#' \itemize{
#' \item the edges data set consists of ten variables of length 9063:
#' \itemize{
#'   \item From: Email address of sender
#'   \item eID:  email ID. If an email ws sent to multiple recipients, the email ID is the same.
#'   \item Date: Date and time email was sent
#'   \item Subject: Subject line of email
#'   \item to: Email address of recipient
#'   \item month: Month email was sent
#'   \item day: Day of month email was sent
#'   \item year: Year email was sent
#'   \item nrecipients: Number of recipients of email
#' }
#' \item the vertices data set consists of 18 variables with information on 55 employees:
#' \itemize{
#'   \item label: Employee's email address
#'   \item LastName: Employee's last name
#'   \item FirstName: Employee's first name
#'   \item BirthDate: Employee's first date
#'   \item BirthCountry: Employee's (fictional) country of birth
#'   \item Gender: Employee's gender
#'   \item CitizenshipCountry: Employee's (fictional) country of citizenship
#'   \item CitizenshipBasis: Is citizenship by birth or parents?
#'   \item CitizenshipStartDate: When employee became a citizen
#'   \item PassportCountry: (Fictional) country issuing employee's passport
#'   \item PassportIssueDate: Date employee received passport
#'   \item PassportExpirationDate: Date employee's passport expires
#'   \item CurrentEmploymentType: Employee's department in the company
#'   \item CurrentEmploymentTitle: Employee's title at the company
#'   \item CurrentEmploymentStartDate: Date employee started at position
#'   \item MilitaryServiceBranch: Branch of the (fictional) military in which the employee serves
#'   \item MilitaryDischargeType: General or honorable discharge from military service?
#' }
#' }
"email"

#' College football games network (undirected)
#'
#' A list of two datasets, vertices and edges, containing data on Division I college football games in the Fall 2000 season.
#' The variables are as follows:
#'
#' @references M. Girvan and M. E. J. Newman, Proc. Natl. Acad. Sci. USA 99, 7821-7826 (2002).
#' @format A list of two data frames:
#' \itemize{
#' \item the edges data set consists of three variables of length 613:
#' \itemize{
#'   \item
#'   \item
#' }
#' \item the vertices data set consists of two variables with information on 157 Iowa high schools:
#' \itemize{
#'   \item from: First school in game
#'   \item to: Second school in game
#'   \item same.conf: An indicator variable that is 1 if the two teams are in the same conference and 0 otherwise.
#' }
#' }
#' @examples
#' # data step: merge vertices and edges
#' ftnet <- merge(
#'   football$edges, football$vertices,
#'   by.x = "from", by.y = "label", all = TRUE
#' )
#'
#' # label independent schools
#' ftnet$schools <- ifelse(ftnet$value == "Independents", ftnet$from, "")
#'
#' # create data plot
#' ggplot(data = ftnet,
#'        aes(from_id = from, to_id = to)) +
#'   geom_net(
#'     aes(
#'       colour = value, group = value,
#'       linetype = factor(same.conf != 1),
#'       label = schools
#'     ),
#'     linewidth = 0.5,
#'     size = 5, vjust = -0.75, alpha = 0.3,
#'     layout = 'fruchtermanreingold'
#'   ) +
#'   theme_net() +
#'   theme(legend.position = "bottom") +
#'   scale_colour_brewer("Conference", palette = "Paired")  +
#'   guides(linetype = FALSE)
"football"

#' Coappearance network of characters in Les Miserables (undirected)
#'
#' A list of two datasets, vertices and edges, containing data on characters and their coapperance in chapters in Victor Hugo's Les Miserables.
#' The variables are as follows:
#'
#' @references D. E. Knuth, The Stanford GraphBase: A Platform for Combinatorial Computing, Addison-Wesley, Reading, MA (1993).
#' @format A list of two data frames:
#' \itemize{
#' \item the edges data set consists of three variables of length 254:
#' \itemize{
#'   \item from: Character 1
#'   \item to: Character 2
#'   \item degree: number of times they appear together in a chapter of Les Miserables
#' }
#' \item the vertices data set consists of two variables with information on 77 characters:
#' \itemize{
#'   \item id: Character ID number
#'   \item label: Character name
#' }
#' }
#' @examples
#' # prep the data
#' lesmisnet <- merge(lesmis$edges, lesmis$vertices, by.x = "from",
#'                    by.y = "label", all = TRUE)
#' lesmisnet$degree[is.na(lesmisnet$degree)] <- 0
#'
#' # create plot
#' ggplot(data = lesmisnet, aes(from_id = from, to_id = to,
#'                              linewidth = degree / 5 + 0.1 )) +
#'   geom_net(aes(size = degree, alpha = degree),
#'            colour = "grey30", ecolour = "grey60",
#'            layout = "fruchtermanreingold", label = TRUE, vjust = -0.75) +
#'   scale_alpha(range = c(0.3, 1)) +
#'   theme_net()
"lesmis"

#' Network of romantic relationships in the TV show Mad Men (undirected)
#'
#' A list of two datasets, vertices and edges, containing information on sexual relations in the TV show Mad Men.
#' This data set was first compiled by Winston Chang for the package gcookbook (under the same name) and was extended here to include
#' the gender of each of the characters.
#' The variables are as follows:
#'
#' @references Winston Chang (2012). gcookbook: Data for "R Graphics Cookbook". R package
#' version 1.0. \url{http://CRAN.R-project.org/package=gcookbook}
#' @format A list of two data frames:
#' \itemize{
#' \item the edges data set consists of two variables of length 39:
#' \itemize{
#'   \item Name1: Name of one of the sexual partners.
#'   \item Name2: Name of the other sexual partner.
#' }
#' \item the vertices data set consists of three variables with information on 45 characters of the show:
#' \itemize{
#'   \item label Name of the character,
#'   \item Gender factor variable of the gender of the character.
#' }
#' }
"madmen"

#' Map of Washington DC Metro area
#'
#' A dataset containing information to draw a map of Rockville, MD, and vicinity using \code{geom_tile}.
#' This information was pulled from Google Maps using the \pkg{ggmap} package.
#' @format A data frame of three variables of length 1638400:
#' \itemize{
#' \item x: degree of longitude
#' \item y: degree of latitude
#' \item fill: fill color in HEX form for that tile location
#' }
#' @examples
#' \dontrun{
#' ggplot(data = metro_map, aes(x = x, y = y)) +
#' geom_raster(fill = metro_map$fill, alpha = 0.75)
#' }
"metro_map"

#' A directed network of Mad Men relationships
#'
#' A list of two datasets, vertices and edges, containing information on sexual advances made in the TV show Mad Men.
#' This data set was first compiled by Winston Chang for the package gcookbook (under the name \code{madmen2}) and was extended here to include
#' the gender of each of the characters.
#' The variables are as follows:
#'
#' @references Winston Chang (2012). gcookbook: Data for "R Graphics Cookbook". R package
#' version 1.0. \url{http://CRAN.R-project.org/package=gcookbook}
#' @format A list of two data frames:
#' \itemize{
#' \item the edges data set consists of two variables of length 87:
#' \itemize{
#'   \item Name1: Name of the character who made a sexual advance toward the character in Name2
#'   \item Name2: Name of the character receiving, not necessarily reciprocating, Name1's advance.
#' }
#' \item the vertices data set consists of two variables with information on 52 characters:
#' \itemize{
#'   \item label: Name of the character
#'   \item Gender: Gender of the character
#' }
#' }
"mm.directed"

#' A protein interaction network (undirected)
#'
#' A list of two datasets, vertices and edges, containing data on the complete protein-protein interaction network in the yeast species S. cerevisiae ( \url{http://www3.nd.edu/~networks/resources.htm}).
#' The variables are as follows:
#' @references H. Jeong, S. Mason, A.L. Barabasi and Z.N. Oltvai, Centrality and lethality of protein networks Nature 411, 41 (2001)
#' @format A list of two data frames:
#' \itemize{
#' \item the edges data set consists of two variables of length 4480:
#' \itemize{
#'   \item from: Protein 1 ID
#'   \item to: Protein 2 ID that interacts with protein 1
#' }
#' \item the vertices vector consists of the corresponding IDs of 2113 proteins in the edges data set
#' }
"protein"

#' High school boys' soccer games in Iowa (undirected)
#'
#' A list of two datasets, vertices and edges, containing data on boys' soccer games at Iowa high schools in the 2011-2014 seasons.
#' This dataset was compiled by Danny Bero (\email{bero.danny@@gmail.com}).
#' The variables are as follows:
#'
#' @format A list of two data frames:
#' \itemize{
#' \item the edges data set consists of 11 variables of length 4484:
#' \itemize{
#'   \item sub: The subregion of the state the school is in (1-8)
#'   \item home: The home team school
#'   \item season: The year the game was played
#'   \item week: Week of the season the game was played
#'   \item date: Date game was played
#'   \item away: The away team school
#'   \item ha: Home team, away team, or neutral?
#'   \item result: Did the home team win, lose, or tie?
#'   \item score: Game final score, home team first
#'   \item diff: Home team score minus away team score
#'   \item same_div: An indicator variable that is 1 if the schools are in the same division and 0 otherwise
#' }
#' \item the vertices data set consists of two variables with information on 157 schools:
#' \itemize{
#'   \item div: Division school is in (1, 2, or 3A)
#'   \item label: School name
#' }
#' }
#' @examples
#' # prep the data
#' soccernet <- merge(soccer$edges, soccer$vertices, by.x = "home",
#'                    by.y = "label", all = TRUE)
#'
#' # create plot
#' ggplot(data = soccernet, aes(from_id = home, to_id = away)) +
#'   geom_net(aes(colour = div, group = div), ealpha = .25, layout = 'fruchtermanreingold') +
#'   facet_wrap(~season) +
#'   theme_net()
"soccer"

#' \pkg{ggplot2} theme attribute inheritance network (directed)
#'
#' A list of two datasets, vertices and edges, containing data on the inheritance structure of theme elements in \pkg{ggplot2} (see \url{http://docs.ggplot2.org/current/theme.html})
#' The variables are as follows:
#'
#' @format A list of two data frames:
#' \itemize{
#' \item the edges data set consists of two variables of length 48:
#' \itemize{
#'   \item child: Theme element that inherits its properties from the corresponding parent element
#'   \item parent: Theme element that passes its properties to its children
#' }
#' \item the vertices data set consists of one variable with information on 53 theme elements:
#' \itemize{
#'   \item name: Name of the theme element
#' }
#' }
"theme_elements"
