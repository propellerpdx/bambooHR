fields <- get_meta(data = "fields") %>%
  httr::content(., as='text', type='json', encoding='UTF-8') %>%
  jsonlite::fromJSON(., simplifyDataFrame=FALSE) %>%
  data.table::rbindlist(fill = TRUE)
result <- get_meta(data = "tables") %>%
  httr::content(., as='text', type='json', encoding='UTF-8') %>%
  jsonlite::fromJSON(., simplifyDataFrame=FALSE)
tables <- purrr::map_chr(result, 'alias') %>%
  tibble::tibble(table_alias = .) %>%
  dplyr::mutate(fields = purrr::map(result, 'fields')) %>%
  tidyr::unnest_longer(fields) %>%
  tidyr::hoist(.col = fields,
               col_alias = 'alias',
               col_name = 'name',
               col_id = 'id',
               col_type = 'type')
empoyee_fields <- get_request(url = 'https://api.bamboohr.com/api/gateway.php/propellerpdx/v1/employees/directory/') %>%
  httr::content(as = 'text', type = 'JSON', encoding = 'UTF-8') %>%
  jsonlite::fromJSON(simplifyDataFrame = F) %>%
  purrr::pluck("fields") %>%
  data.table::rbindlist()
