async function handler(event, _context, _callback) {
  console.log(JSON.stringify(event));
  return "SUCCESS";
}

module.exports = {
  handler
}