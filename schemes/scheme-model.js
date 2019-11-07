const db = require('../data/db-config.js');

module.exports = {
	find,
	findById,
	findSteps,
	add,
	addStep,
	update,
	remove
};

function find() {
	return db.select('*').from('schemes');

	//db('users')
}

function findById(id) {
	// console.log({ id });
	return db('schemes')
		.where({ id })
		.first();
	// db
	// 	.select('*')
	// 	.from('schemes')
	// 	.where('id', '=', id);
}

function findSteps(id) {
	// console.log(id);
	return db
		.select('steps.id', 'scheme_name', 'instructions', 'step_number')
		.from('schemes')
		.join('steps', 'schemes.id', '=', 'steps.scheme_id')
		.where('schemes.id', '=', id);

	// return db('schemes')
	// 	.join('steps', 'schemes.id', '=', 'steps.scheme_id')
	// 	.where('schemes.id', '=', id);
}

function add(body) {
	return db
		.insert(body, 'id')
		.into('schemes')
		.then(ids => findById(ids[0]));
}

function addStep(body, id) {
	body = { ...body, scheme_id: id };
	console.log(body);
	return db
		.insert(body, 'id')
		.into('steps')
		.join('schemes', 'schemes.id', '=', 'steps.scheme_id')
		.where('steps.scheme_id', '=', { id });
}

function update(body, id) {
	return db('schemes')
		.where({ id })
		.update(body)
		.then(ids => findById(id));
}

function remove(id) {
	return db('schemes')
		.where({ id })
		.del();
}
