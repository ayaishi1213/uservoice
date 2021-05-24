class Age < ActiveHash::Base 
  self.data = [
    {id: 1, name: '--'},
    {id: 2, name: '10代'},
    {id: 3, name: '20代前半'},
    {id: 4, name: '20代後半'}
    {id: 5, name: '30代前半'}
    {id: 6, name: '30代後半'}
    {id: 7, name: '40代'}
    {id: 8, name: '50代'}
    {id: 9, name: '60代'}
    {id: 10, name: '70代以上'}
  ]
end
