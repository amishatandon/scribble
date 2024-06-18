const express = require("express");
var http= require("http");
const app= express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const mongoose = require("mongoose");
var io = require("socket.io")(server);
const Room = require('./models/room');
const getWord= require('./api/getWord');

app.use(express.json());

const DB ='mongodb+srv://amishatandon2003:EsInanko8FAeF27e@cluster0.msjqmfi.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0'

mongoose.connect(DB).then(()=> {
    console.log('Connection Successful!');
}).catch((e)=>{
    console.log(e);
})

io.on('connect', (socket)=>{
    console.log('connected');
    socket.on('create-game', async({nickname, name, occupancy, maxRounds})=>{
        try{
const existingRoom = await Room.findOne({name});
if(existingRoom){
    socket.emit('notCorrectGame', 'Room with the name already exist!!');
    return;
}
let room = new Room();
const word = getWord();
room.word= word;
room.name= name;
room.occupancy= occupancy;
room.maxRounds= maxRounds;

let player= {
    socketID: socket.id,
    nickname,
    isPartyLeader: true,
}
room.players.push(player);
console.log('Done');
room = await room.save();
socket.join(room.name);
io.to(name).emit('updateRoom', room);
        } catch(err){
            console.log(err);
        }
    })
})
server.listen(port, "0.0.0.0", ()=>{
    console.log('Server started and running on port'+ port);
})