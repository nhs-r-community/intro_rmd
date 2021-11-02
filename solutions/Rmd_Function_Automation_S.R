### Using render() function to run a rmarkdown report from outside of rmarkdown

p_load(rmarkdown)

render("solutions/Data_Import_Wrangle_S.Rmd", output_file = "My_Render_Function")




### Use render to run a parameterised report

render("solutions/Parameterised_Report_S.Rmd", params = list(
  month = "March"
), output_file = "My_Render_Function_Parameters"
)




### Use a function to generate multiple parameterised reports

render_reports <- function(month) {

  render("solutions/Parameterised_Report_S.Rmd", params = list(
    month = month
  ), output_file = paste0("My_Multiple_Render_Function_Parameters_", month))

}




### Render a single report with the function

render_reports("January")


### Render separate report for every month

months <- c("January", "February", "March", "April")


map(months, render_reports)





### Run all Rmd files in a directory


files <- list.files(pattern = "[.]Rmd$")

for (f in files) rmarkdown::render(f)
















