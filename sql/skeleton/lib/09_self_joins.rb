# == Schema Information
#
# Table name: stops
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: routes
#
#  num         :string       not null, primary key
#  company     :string       not null, primary key
#  pos         :integer      not null, primary key
#  stop_id     :integer

require_relative './sqlzoo.rb'

def num_stops
  # How many stops are in the database?
  execute(<<-SQL)
  SELECT
    count(Distinct stop_id)
  FROM
    routes
  SQL
end

def craiglockhart_id
  # Find the id value for the stop 'Craiglockhart'.
  execute(<<-SQL)
  SELECT
    id
  FROM
    stops
  WHERE
    name='Craiglockhart'
  SQL
end

def lrt_stops
  # Give the id and the name for the stops on the '4' 'LRT' service.
  execute(<<-SQL)
  SELECT
    stops.id, stops.name
  FROM
    stops
    JOIN
    routes
    ON stops.id = routes.stop_id
  WHERE
    num='4'
    AND
    company='LRT'
  SQL
end

def connecting_routes
  # Consider the following query:
  #
  # SELECT
  #   company,
  #   num,
  #   COUNT(*)
  # FROM
  #   routes
  # WHERE
  #   stop_id = 149 OR stop_id = 53
  # GROUP BY
  #   company, num
  #
  # The query gives the number of routes that visit either London Road
  # (149) or Craiglockhart (53). Run the query and notice the two services
  # that link these stops have a count of 2. Add a HAVING clause to restrict
  # the output to these two routes.
  execute(<<-SQL)
  SELECT
   company,
   num,
   COUNT(*)
  FROM
   routes
  WHERE
   stop_id = 149 OR stop_id = 53
  GROUP BY
   company, num
  HAVING
    count(pos) = 2
  SQL
end

def cl_to_lr
  # Consider the query:
  #
  # SELECT
  #   a.company,
  #   a.num,
  #   a.stop_id,
  #   b.stop_id
  # FROM
  #   routes a
  # JOIN
  #   routes b ON (a.company = b.company AND a.num = b.num)
  # WHERE
  #   a.stop_id = 53
  #
  # Observe that b.stop_id gives all the places you can get to from
  # Craiglockhart, without changing routes. Change the query so that it
  # shows the services from Craiglockhart to London Road.
  execute(<<-SQL)
  SELECT
   a.company,
   a.num,
   a.stop_id,
   b.stop_id
  FROM
   routes a
  JOIN
   routes b ON (a.company = b.company AND a.num = b.num)
  WHERE
   a.stop_id = 53
   AND
   b.stop_id = 149
  SQL
end

def cl_to_lr_by_name
  # Consider the query:
  #
  # SELECT
  #   a.company,
  #   a.num,
  #   stopa.name,
  #   stopb.name
  # FROM
  #   routes a
  # JOIN
  #   routes b ON (a.company = b.company AND a.num = b.num)
  # JOIN
  #   stops stopa ON (a.stop_id = stopa.id)
  # JOIN
  #   stops stopb ON (b.stop_id = stopb.id)
  # WHERE
  #   stopa.name = 'Craiglockhart'
  #
  # The query shown is similar to the previous one, however by joining two
  # copies of the stops table we can refer to stops by name rather than by
  # number. Change the query so that the services between 'Craiglockhart' and
  # 'London Road' are shown.
  execute(<<-SQL)
   SELECT
     a.company,
     a.num,
     stopa.name,
     stopb.name
   FROM
     routes a
   JOIN
     routes b ON (a.company = b.company AND a.num = b.num)
   JOIN
     stops stopa ON (a.stop_id = stopa.id)
   JOIN
     stops stopb ON (b.stop_id = stopb.id)
   WHERE
     stopa.name = 'Craiglockhart'
     AND
     stopb.name = 'London Road'
  SQL
end

def haymarket_and_leith
  # Give the company and num of the services that connect stops
  # 115 and 137 ('Haymarket' and 'Leith')
  execute(<<-SQL)
  SELECT
    Distinct a.company, a.num
  FROM
    routes a
    JOIN
    routes b ON (a.num = b.num and a.company = b.company)
  WHERE
    a.stop_id = 115
    AND
    b.stop_id = 137
  SQL
end

def craiglockhart_and_tollcross
  # Give the company and num of the services that connect stops
  # 'Craiglockhart' and 'Tollcross'
  execute(<<-SQL)
  SELECT
    a.company, a.num
  FROM
    routes a
    JOIN
    routes b ON (a.num = b.num AND a.company = b.company)
    JOIN
    stops stopa ON (a.stop_id = stopa.id)
    JOIN
    stops stopb ON (b.stop_id = stopb.id)
  WHERE
    stopa.name = 'Craiglockhart'
    AND
    stopb.name = 'Tollcross'
  SQL
end

def start_at_craiglockhart
  # Give a distinct list of the stops that can be reached from 'Craiglockhart'
  # by taking one bus, including 'Craiglockhart' itself. Include the stop name,
  # as well as the company and bus no. of the relevant service.
  execute(<<-SQL)
  SELECT
    stopb.name, a.company, a.num
  FROM
    stops stopa
    JOIN
    routes a ON (stopa.id = a.stop_id)
    JOIN
    routes b ON (b.num = a.num AND b.company = a.company)
    JOIN
    stops stopb ON (stopb.id = b.stop_id)
  WHERE
    stopa.name = 'Craiglockhart'
  SQL
end

def craiglockhart_to_sighthill
  # Find the routes involving two buses that can go from Craiglockhart to
  # Sighthill. Show the bus no. and company for the first bus, the name of the
  # stop for the transfer, and the bus no. and company for the second bus.
  execute(<<-SQL)
  SELECT Distinct
    start_route.num,
    start_route.company,
    transfer_stop.name,
    to_sight.num,
    to_sight.company
  FROM
    stops start_stop
    JOIN
    routes start_route ON (start_stop.id = start_route.stop_id)
    JOIN
    routes transfer ON (start_route.num = transfer.num AND start_route.company = transfer.company)
    JOIN
    stops transfer_stop ON (transfer_stop.id = transfer.stop_id)
    JOIN
    routes fr_transfer ON (transfer.stop_id = fr_transfer.stop_id)
    JOIN
    routes to_sight ON (fr_transfer.num = to_sight.num AND
                      fr_transfer.company = to_sight.company)
    JOIN
    stops stop_sight ON (stop_sight.id = to_sight.stop_id)
  WHERE
    start_stop.name = 'Craiglockhart'
    AND
    transfer_stop.name NOT IN ('Craiglockhart', 'Sighthill')
    AND
    stop_sight.name = 'Sighthill'
  ORDER BY
    start_route.num
  SQL
end
