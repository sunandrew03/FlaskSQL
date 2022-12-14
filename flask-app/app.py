###
# Main application interface
###

# import the create app function 
# that lives in src/__init__.py
from flask import jsonify, make_response, current_app, request

from src import create_app, db

# create the app object
app = create_app()

#returns all sales bu a customer
@app.route('/sale/<userID>', methods=['GET'])
def get_customersale(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from sale where customerID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#returns all customer details
@app.route('/customer/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from customer where customerID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#returns all employee details
@app.route('/customer/<userID>', methods=['GET'])
def get_employee(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from employee where employeeID = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

#returns sales with total value over 1000
@app.route('/bigSales', methods=['GET'])
def bigSales():
   cur = db.get_db().cursor()
   cur.execute('select stockID from item where quantity * price > 1000')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

#returns sales with total value over 1000
@app.route('/sector', methods=['GET'])
def sector():
   cur = db.get_db().cursor()
   cur.execute('select COUNT(sectorID) from stock, GROUP BY sectorID')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

#returns list of stocks, by most number of times traded
@app.route('/popular', methods=['GET'])
def popular():
   cur = db.get_db().cursor()
   cur.execute('select stockID, COUNT(stockID) as count from item GROUP BY stockID ORDER by count DESC')
   row_headers = [x[0] for x in cur.description]
   json_data = []
   theData = cur.fetchall()
   for row in theData:
       json_data.append(dict(zip(row_headers, row)))
   return jsonify(json_data)

@app.route('/newitem', methods=['POST'])
def newitem():
   current_app.logger.info(request.form)
   cur = db.get_db().cursor()
   price =  request.form['price']
   quantity = request.form['quantity']
   stockID = request.form['stockID']
   query = f'INSERT INTO item(price, quantity, stockID) VALUES (\"{price}\", \"{quantity}\", \"{stockID}\")'
   cur.execute(query)
   db.get_db().commit()
   return ""

@app.route('/newsale', methods=['POST'])
def newsale():
   current_app.logger.info(request.form)
   cur = db.get_db().cursor()
   saleID =  request.form['saleID']
   query = f'INSERT INTO sale(id) VALUES (\"{saleID}\")'
   cur.execute(query)
   db.get_db().commit()
   return ""

if __name__ == '__main__':
    # we want to run in debug mode (for hot reloading) 
    # this app will be bound to port 4000. 
    # Take a look at the docker-compose.yml to see 
    # what port this might be mapped to... 
    app.run(debug = True, host = '0.0.0.0', port = 4000)
