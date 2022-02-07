const Onvif = require('onvif');
require('onvif-snapshot');
const fs = require('fs');

const args = process.argv.slice(2);

function int2ip (ipInt) {
    return ( (ipInt>>>24) +'.' + (ipInt>>16 & 255) +'.' + (ipInt>>8 & 255) +'.' + (ipInt & 255) );
}

try {
	const Cam = new Onvif.Cam({
		hostname: args[0],
		username: args[1],
		password: args[2]
	}, async function(err){
		if(err) throw err;


		try{
			var data = await this.getSnapshot();
			var filetype = data.mimeType.split("/")[1];
			fs.writeFileSync("images/"+int2ip(args[0])+"."+filetype, data.rawImage);
		}catch(e){
			return console.error(e);
		}

		console.log(data);
	});
}catch(e) {
	console.log(hostname,"failed.")
}
