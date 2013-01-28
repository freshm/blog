module UsersHelper
  
  def country_option
    ['',
     'Germany',
     'England',
     'France',
     'Norway', 
     'Sweden',
     'Finnland',
     'Belgium',
     'Austria',
     'Greece',
     'Ireland',
     'Slovenia',
     'Romania',
     'Latvia',
     'Spain',
     'Italy',
     'Malta',
     'Cyprus',
     'Portugal',
     'Netherlands',
     'Poland',
     'Luxembourg',
     'Denmark',
     'Estonia',
     'Turkey',
     'India',
     'China',
     'Japan',
     'America',
     'Canada',
     'Australia',
     'Egypt',
     'Russia'].sort
  end
  
  def birthday_soon(user)
    user.time_to_next_birthday <= 7
  end
  
  def birthday(user)
    user.next_birthday == Date.today
    # user.birthday.day == Date.today.day && user.birthday.month == Date.today.month
  end
end
