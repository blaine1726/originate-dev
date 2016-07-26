# app/assets/javascripts/utils.coffee

@amountFormat = (amount) ->
  '$ ' + Number(amount).toLocaleString()
