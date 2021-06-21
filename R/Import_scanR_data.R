## ScanR analysis package

#' @export
import_metadata <- function(experiment_descriptor_dir){
  meta_data <- read.table(experiment_descriptor_dir, 
                          header=FALSE, skip=2) 
  colnames(meta_data) <- c("IMAGE","X","Y","AF","ID","PLATE","WELL","SUBPOS","TIME")
  meta_data$WELL <- stringr::str_remove(meta_data$WELL, "WELL=")
  meta_data$ID <- stringr::str_remove(meta_data$ID, "ID=")
  meta_data$TIME <- stringr::str_remove(meta_data$TIME, "TIME=")
  head(meta_data)
}

#' @export
add_metadata <- function(parameter_data_obj, meta_data_obj){
             parameter_data_obj$Well <- parameter_data_obj$Parent.Object.ID..Well. + 1
             merge(parameter_data_obj, as.data.frame(cbind(Well=meta_data_obj$WELL, ID=meta_data_obj$ID)) , by="Well")
}

