# lof

git commit -a
git push


remove.packages('lof')
unloadNamespace('lof')
#library(lof)

library(devtools)
install_github('foocheung/lof')

library(lof)
run_app()
