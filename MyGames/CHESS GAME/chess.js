//this is where program execution starts
$(document).ready(function() {
   
  gamesetup();

  $('.chess_piece').click(function(e) {

    var selectedpiece = {
      name: '',
      id: global.variables.selectedpiece
    };

    if (global.variables.selectedpiece == ''){
      selectedpiece.name = $('#' + e.target.id).attr('chess');
    } else {
      selectedpiece.name = $('#' + global.variables.selectedpiece).attr('chess');
    }

    var target_icon = {
      name: $(this).attr('chess'),
      id: e.target.id
    };

    if (global.variables.selectedpiece == '' && selectedpiece.name.slice(0,1) == global.variables.turn) {

      // call show_moves function for white or black
      global.variables.selectedpiece = e.target.id;

      if(selectedpiece.name.slice(0,1)=='w'){

        w_show_moves(target_icon.name,false);

      } else if(selectedpiece.name.slice(0,1)=='b'){

        b_show_moves(target_icon.name,false);

      }

    } else if (global.variables.selectedpiece !='' && target_icon.name == 'null') { 
         
      //write the code for move 
     // check and prevent if it's not trying to move pieces not in its movement range
     //alert(global.variables.selectedpiece);
        if (global.variables.highlighted.includes(target_icon.id)) {
          move(target_icon);
          endturn();
         }
        
    } else if (global.variables.selectedpiece !='' && target_icon.name != 'null' && target_icon.id != selectedpiece.id && selectedpiece.name.slice(0,1) != target_icon.name.slice(0,1)){ 
      
      //write the code for capture

      //check and prevent if it's not trying to capture pieces not in its movement range
      if (selectedpiece.id != target_icon.id && global.variables.highlighted.includes(target_icon.id)) { 
  
        capture(target_icon)
        endturn();
        
      }
        

    } else if (global.variables.selectedpiece !='' && target_icon.name != 'null' && target_icon.id != selectedpiece.id && selectedpiece.name.slice(0,1) == target_icon.name.slice(0,1)){ 
      
      // toggle the highlight
       togglehighlight(global.variables.highlighted);
       global.variables.highlighted=[];
       global.variables.selectedpiece = target_icon.id;
       if(selectedpiece.name.slice(0,1)=='w'){

        w_show_moves(target_icon.name,false);

      } else if(selectedpiece.name.slice(0,1)=='b'){

        b_show_moves(target_icon.name,false);
        
      }

      }  else if (global.variables.selectedpiece !='' && target_icon.name != 'null' && target_icon.id == selectedpiece.id && selectedpiece.name.slice(0,1) == target_icon.name.slice(0,1)){ 
        togglehighlight(global.variables.highlighted);
        global.variables.highlighted=[];
        global.variables.selectedpiece='';
      }
  });
});



//create a gloabal variable for updation

var global = {

  variables: {
    turn: 'w',
    selectedpiece: '',
    highlighted: [],
    recent_move_ids:[],
    recent_move_icons:[],
    recent_move_attr:[],
    w_captured_iteration:1,
    b_captured_iteration:1,
    pieces: {
      w_king: {
        position: '5_1',
        captured: false,
        moved: false,
        type: 'w_king'
        
      },
      w_queen: {
        position: '4_1',
        captured: false,
        moved: false,
        type: 'w_queen'
      },
      w_bishop1: {
        position: '3_1',
        captured: false,
        moved: false,
        type: 'w_bishop'
      },
      w_bishop2: {
        position: '6_1',
        captured: false,
        moved: false,
        type: 'w_bishop'
      },
      w_knight1: {
        position: '2_1',
        captured: false,
        moved: false,
        type: 'w_knight'
      },
      w_knight2: {
        position: '7_1',
        captured: false,
        moved: false,
        type: 'w_knight'
      },
      w_rook1: {
        position: '1_1',
        captured: false,
        moved: false,
        type: 'w_rook'
      },
      w_rook2: {
        position: '8_1',
        captured: false,
        moved: false,
        type: 'w_rook'
      },
      w_pawn1: {
        position: '1_2',
        captured: false,
        moved: false,
        type: 'w_pawn'
        
      },
      w_pawn2: {
        position: '2_2',
        captured: false,
        moved: false,
        type: 'w_pawn'
        
      },
      w_pawn3: {
        position: '3_2',
        captured: false,
        moved: false,
        type: 'w_pawn'
       
      },
      w_pawn4: {
        position: '4_2',
        captured: false,
        type: 'w_pawn',
        moved: false
      },
      w_pawn5: {
        position: '5_2',
        captured: false,
        moved: false,
        type: 'w_pawn'
       
      },
      w_pawn6: {
        position: '6_2',
        captured: false,
        moved: false,
        type: 'w_pawn'
        
      },
      w_pawn7: {
        position: '7_2',
        captured: false,
        moved: false,
        type: 'w_pawn'
        
      },
      w_pawn8: {
        position: '8_2',
        captured: false,
        moved: false,
        type: 'w_pawn'
      },

      b_king: {
        position: '4_8',
        captured: false,
        moved: false,
        type: 'b_king'
      },
      b_queen: {
        position: '5_8',
        captured: false,
        moved: false,
        type: 'b_queen'
      },
      b_bishop1: {
        position: '3_8',
        captured: false,
        moved: false,
        type: 'b_bishop'
      },
      b_bishop2: {
        position: '6_8',
        captured: false,
        moved: false,
        type: 'b_bishop'
      },
      b_knight1: {
        position: '2_8',
        captured: false,
        moved: false,
        type: 'b_knight'
      },
      b_knight2: {
        position: '7_8',
        captured: false,
        moved: false,
        type: 'b_knight'
      },
      b_rook1: {
        position: '1_8',
        captured: false,
        moved: false,
        type: 'b_rook'
      },
      b_rook2: {
        position: '8_8',
        captured: false,
        moved: false,
        type: 'b_rook'
      },
      b_pawn1: {
        position: '1_7',
        captured: false,
        moved: false,
        type: 'b_pawn'
       
      },
      b_pawn2: {
        position: '2_7',
        captured: false,
        moved: false,
        type: 'b_pawn'
        
      },
      b_pawn3: {
        position: '3_7',
        captured: false,
        moved: false,
        type: 'b_pawn'
      
      },
      b_pawn4: {
        position: '4_7',
        captured: false,
        moved: false,
        type: 'b_pawn'
      
      },
      b_pawn5: {
        position: '5_7',
        captured: false,
        moved: false,
        type: 'b_pawn'
       
      },
      b_pawn6: {
        position: '6_7',
        captured: false,
        moved: false,
        type: 'b_pawn'
       
      },
      b_pawn7: {
        position: '7_7',
        captured: false,
        moved: false,
        type: 'b_pawn'
      
      },
      b_pawn8: {
        position: '8_7',
        captured: false,
        moved: false,
        type: 'b_pawn'
       
      }

    }
  }
};


//it is first function to execute when page load

     function gamesetup() {
      $('.chess_piece').attr('chess', 'null');     //initially set all cell icon to null

     let key_name;
     let obj_length=Object.keys(global.variables.pieces).length;
     for(let i=0;i<obj_length;i++){
      key_name=Object.keys(global.variables.pieces)[i];
      $('#' + global.variables.pieces[key_name].position).attr('chess', key_name);    //set attr id and  value is to icons id and name
     }

      //alert("called");
    }


   //it is the function used to show what are moves is possible for selected icon
   //forCheck argument used for if options are highlight or return
    function w_show_moves(selectedpiece,forCheck) {              

      let position = { x: '', y: '' };
      position.x = global.variables.pieces[selectedpiece].position.split('_')[0];
      position.y = global.variables.pieces[selectedpiece].position.split('_')[1];

      
      var options = []; 
      let allmove_options = [];
      var startpoint = global.variables.pieces[selectedpiece].position;

      if (global.variables.highlighted.length != 0) {
           togglehighlight(global.variables.highlighted);
      }

      switch (global.variables.pieces[selectedpiece].type) {

        case 'w_king':

           let w_kingmoves=[];

            w_kingmoves=[{ x: 1, y: 1 },{ x: 1, y: 0 },{ x: 1, y: -1 },{ x: 0, y: -1 },{ x: -1, y: -1 },{ x: -1, y: 0 },{ x: -1, y: 1 },{ x: 0, y: 1 }];
             
            for(let i=0;i<w_kingmoves.length;i++){
              allmove_options.push((parseInt(position.x) + parseInt(w_kingmoves[i].x)) + '_' + (parseInt(position.y) + parseInt(w_kingmoves[i].y)));
            }

          options = possible_options(startpoint, allmove_options, global.variables.pieces[selectedpiece].type);
          if(forCheck==true){
            return options;
          }
          console.log(options);
          global.variables.highlighted = options;
          togglehighlight(options);
          break;

        case 'w_pawn':
          
          let w_pawnmoves=[];
          if (global.variables.pieces[selectedpiece].moved == false) {   
            w_pawnmoves=[{ x: 0, y: 1 },{ x: 0, y: 2 },{ x: 1, y: 1 },{ x: -1, y: 1 }];
            for(let i=0;i<w_pawnmoves.length;i++){
              allmove_options.push((parseInt(position.x) + parseInt(w_pawnmoves[i].x)) + '_' + (parseInt(position.y) + parseInt(w_pawnmoves[i].y)));
            }
          }
          else if (global.variables.pieces[selectedpiece].moved == true) {
            w_pawnmoves=[{ x: 0, y: 1 },{ x: 1, y: 1 },{ x: -1, y: 1 }];
            for(let i=0;i<w_pawnmoves.length;i++){
              allmove_options.push((parseInt(position.x) + parseInt(w_pawnmoves[i].x)) + '_' + (parseInt(position.y) + parseInt(w_pawnmoves[i].y)));
            }
           }

          options = possible_options(startpoint, allmove_options, global.variables.pieces[selectedpiece].type);
          if(forCheck==true){
            return options;
          }
          console.log(options);
          global.variables.highlighted = options;
          togglehighlight(options);
          break;
        
          case 'w_knight':

            let w_knightmoves=[{ x: -1, y: 2 },{ x: 1, y: 2 },{ x: 1, y: -2 },{ x: -1, y: -2 },{ x: 2, y: 1 },{ x: 2, y: -1 },{ x: -2, y: -1 },{ x: -2, y: 1 }];
             for(let i=0;i<w_knightmoves.length;i++){
              allmove_options.push ((parseInt(position.x) + parseInt(w_knightmoves[i].x)) + '_' + (parseInt(position.y) + parseInt(w_knightmoves[i].y)));
            }
  
            options = possible_options(startpoint, allmove_options, global.variables.pieces[selectedpiece].type);
            if(forCheck==true){
              return options;
            }
            console.log(options);
            global.variables.highlighted = options;
            togglehighlight(options);
            break;
           
           case 'w_bishop':

            move1 =side_cross_options(position,[{x: 1, y: 1},{x: 2, y: 2},{x: 3, y: 3},{x: 4, y: 4},{x: 5, y: 5},{x: 6, y: 6},{x: 7, y: 7}],'w','b');
            move2 =side_cross_options(position,[{x: 1, y: -1},{x: 2, y: -2},{x: 3, y: -3},{x: 4, y: -4},{x: 5, y: -5},{x: 6, y: -6},{x: 7, y: -7}],'w','b');
            move3 =side_cross_options(position,[{x: -1, y: 1},{x: -2, y: 2},{x: -3, y: 3},{x: -4, y: 4},{x: -5, y: 5},{x: -6, y: 6},{x: -7, y: 7}],'w','b');
            move4 =side_cross_options(position,[{x: -1, y: -1},{x: -2, y: -2},{x: -3, y: -3},{x: -4, y: -4},{x: -5, y: -5},{x: -6, y: -6},{x: -7, y: -7}],'w','b');
  
            options = move1.concat(move2).concat(move3).concat(move4);
            if(forCheck==true){
              return options;
            }
            global.variables.highlighted = options;
            console.log(options);
            togglehighlight(options);
  
            break;

            case 'w_rook':

              move1 = side_cross_options(position,[{x: 1, y: 0},{x: 2, y: 0},{x: 3, y: 0},{x: 4, y: 0},{x: 5, y: 0},{x: 6, y: 0},{x: 7, y: 0}],'w','b');
              move2 = side_cross_options(position,[{x: 0, y: 1},{x: 0, y: 2},{x: 0, y: 3},{x: 0, y: 4},{x: 0, y: 5},{x: 0, y: 6},{x: 0, y: 7}],'w','b');
              move3 = side_cross_options(position,[{x: -1, y: 0},{x: -2, y: 0},{x: -3, y: 0},{x: -4, y: 0},{x: -5, y: 0},{x: -6, y: 0},{x: -7, y: 0}],'w','b');
              move4 = side_cross_options(position,[{x: 0, y: -1},{x: 0, y: -2},{x: 0, y: -3},{x: 0, y: -4},{x: 0, y: -5},{x: 0, y: -6},{x: 0, y: -7}],'w','b');
    
              options = move1.concat(move2).concat(move3).concat(move4);
              if(forCheck==true){
                return options;
              }
              global.variables.highlighted = options;
              console.log(options);
              togglehighlight(options);
              
              break;

             case 'w_queen':

                move1 = side_cross_options(position,[{x: 1, y: 1},{x: 2, y: 2},{x: 3, y: 3},{x: 4, y: 4},{x: 5, y: 5},{x: 6, y: 6},{x: 7, y: 7}],'w','b');
                move2 = side_cross_options(position,[{x: 1, y: -1},{x: 2, y: -2},{x: 3, y: -3},{x: 4, y: -4},{x: 5, y: -5},{x: 6, y: -6},{x: 7, y: -7}],'w','b');
                move3 = side_cross_options(position,[{x: -1, y: 1},{x: -2, y: 2},{x: -3, y: 3},{x: -4, y: 4},{x: -5, y: 5},{x: -6, y: 6},{x: -7, y: 7}],'w','b');
                move4 = side_cross_options(position,[{x: -1, y: -1},{x: -2, y: -2},{x: -3, y: -3},{x: -4, y: -4},{x: -5, y: -5},{x: -6, y: -6},{x: -7, y: -7}],'w','b');
                move5 = side_cross_options(position,[{x: 1, y: 0},{x: 2, y: 0},{x: 3, y: 0},{x: 4, y: 0},{x: 5, y: 0},{x: 6, y: 0},{x: 7, y: 0}],'w','b');
                move6 = side_cross_options(position,[{x: 0, y: 1},{x: 0, y: 2},{x: 0, y: 3},{x: 0, y: 4},{x: 0, y: 5},{x: 0, y: 6},{x: 0, y: 7}],'w','b');
                move7 = side_cross_options(position,[{x: -1, y: 0},{x: -2, y: 0},{x: -3, y: 0},{x: -4, y: 0},{x: -5, y: 0},{x: -6, y: 0},{x: -7, y: 0}],'w','b');
                move8 = side_cross_options(position,[{x: 0, y: -1},{x: 0, y: -2},{x: 0, y: -3},{x: 0, y: -4},{x: 0, y: -5},{x: 0, y: -6},{x: 0, y: -7}],'w','b');
      
                options = move1.concat(move2).concat(move3).concat(move4).concat(move5).concat(move6).concat(move7).concat(move8);
                if(forCheck==true){
                  return options;
                }
                global.variables.highlighted = options;
                console.log(options);
                togglehighlight(options);
      
                break;   

      }
    }


    function b_show_moves(selectedpiece,forCheck) {              

      let position = { x: '', y: '' };
      position.x = global.variables.pieces[selectedpiece].position.split('_')[0];
      position.y = global.variables.pieces[selectedpiece].position.split('_')[1];

      
      var options = []; 
      let allmove_options = [];
      var startpoint = global.variables.pieces[selectedpiece].position;

      if (global.variables.highlighted.length != 0) {
           togglehighlight(global.variables.highlighted);
      }

      switch (global.variables.pieces[selectedpiece].type) {

        case 'b_king':

         let b_kingmoves=[];

         b_kingmoves=[{ x: 1, y: 1 },{ x: 1, y: 0 },{ x: 1, y: -1 },{ x: 0, y: -1 },{ x: -1, y: -1 },{ x: -1, y: 0 },{ x: -1, y: 1 },{ x: 0, y: 1 }];
             
         for(let i=0;i<b_kingmoves.length;i++){
          allmove_options.push((parseInt(position.x) + parseInt(b_kingmoves[i].x)) + '_' + (parseInt(position.y) + parseInt(b_kingmoves[i].y)));
         }
     
          options = possible_options(startpoint,allmove_options, global.variables.pieces[selectedpiece].type);
          if(forCheck==true){
            return options;
          }
          console.log(options);
          global.variables.highlighted = options;
          togglehighlight(options);
          break;

        case 'b_pawn':

          let b_pawnmoves=[];
          if (global.variables.pieces[selectedpiece].moved == false) {   
            b_pawnmoves=[{ x: 0, y: -1 },{ x: 0, y: -2 },{ x: 1, y: -1 },{ x: -1, y: -1 }];
            for(let i=0;i<b_pawnmoves.length;i++){
              allmove_options.push((parseInt(position.x) + parseInt(b_pawnmoves[i].x)) + '_' + (parseInt(position.y) + parseInt(b_pawnmoves[i].y)));
            }
          }
          else if (global.variables.pieces[selectedpiece].moved == true) {
            b_pawnmoves=[{ x: 0, y: -1 },{ x: 1, y: -1 },{ x: -1, y: -1 }];
            for(let i=0;i<b_pawnmoves.length;i++){
              allmove_options.push((parseInt(position.x) + parseInt(b_pawnmoves[i].x)) + '_' + (parseInt(position.y) + parseInt(b_pawnmoves[i].y)));
            }
           }

          options = possible_options(startpoint, allmove_options, global.variables.pieces[selectedpiece].type);
          if(forCheck==true){
            return options;
          }
          console.log(options);
          global.variables.highlighted = options;
          togglehighlight(options);
          break;
  
          case 'b_knight':
  
            let b_knightmoves=[{ x: -1, y: 2 },{ x: 1, y: 2 },{ x: 1, y: -2 },{ x: -1, y: -2 },{ x: 2, y: 1 },{ x: 2, y: -1 },{ x: -2, y: -1 },{ x: -2, y: 1 }];
            for(let i=0;i<b_knightmoves.length;i++){
              allmove_options.push ((parseInt(position.x) + parseInt(b_knightmoves[i].x)) + '_' + (parseInt(position.y) + parseInt(b_knightmoves[i].y)));
           }
  
            options = possible_options(startpoint, allmove_options, global.variables.pieces[selectedpiece].type);
            if(forCheck==true){
              return options;
            }
            console.log(options);
            global.variables.highlighted = options;
            togglehighlight(options);
            break;

          case 'b_bishop':

            move1 = side_cross_options(position,[{x: 1, y: 1},{x: 2, y: 2},{x: 3, y: 3},{x: 4, y: 4},{x: 5, y: 5},{x: 6, y: 6},{x: 7, y: 7}],'b','w');
            move2 = side_cross_options(position,[{x: 1, y: -1},{x: 2, y: -2},{x: 3, y: -3},{x: 4, y: -4},{x: 5, y: -5},{x: 6, y: -6},{x: 7, y: -7}],'b','w');
            move3 = side_cross_options(position,[{x: -1, y: 1},{x: -2, y: 2},{x: -3, y: 3},{x: -4, y: 4},{x: -5, y: 5},{x: -6, y: 6},{x: -7, y: 7}],'b','w');
            move4 = side_cross_options(position,[{x: -1, y: -1},{x: -2, y: -2},{x: -3, y: -3},{x: -4, y: -4},{x: -5, y: -5},{x: -6, y: -6},{x: -7, y: -7}],'b','w');
  
            options = move1.concat(move2).concat(move3).concat(move4);
            if(forCheck==true){
              return options;
            }
            global.variables.highlighted = options;
            console.log(options);
            togglehighlight(options);
            break;

            case 'b_rook':
        
             move1 = side_cross_options(position,[{x: 1, y: 0},{x: 2, y: 0},{x: 3, y: 0},{x: 4, y: 0},{x: 5, y: 0},{x: 6, y: 0},{x: 7, y: 0}],'b','w');
             move2 = side_cross_options(position,[{x: 0, y: 1},{x: 0, y: 2},{x: 0, y: 3},{x: 0, y: 4},{x: 0, y: 5},{x: 0, y: 6},{x: 0, y: 7}],'b','w');
             move3 = side_cross_options(position,[{x: -1, y: 0},{x: -2, y: 0},{x: -3, y: 0},{x: -4, y: 0},{x: -5, y: 0},{x: -6, y: 0},{x: -7, y: 0}],'b','w');
             move4 = side_cross_options(position,[{x: 0, y: -1},{x: 0, y: -2},{x: 0, y: -3},{x: 0, y: -4},{x: 0, y: -5},{x: 0, y: -6},{x: 0, y: -7}],'b','w');
    
              options = move1.concat(move2).concat(move3).concat(move4);
              if(forCheck==true){
                return options;
              }
              global.variables.highlighted = options;
              console.log(options);
              togglehighlight(options);
              
              break;
      
           case 'b_queen':
          
            move1 = side_cross_options(position,[{x: 1, y: 1},{x: 2, y: 2},{x: 3, y: 3},{x: 4, y: 4},{x: 5, y: 5},{x: 6, y: 6},{x: 7, y: 7}],'b','w');
            move2 = side_cross_options(position,[{x: 1, y: -1},{x: 2, y: -2},{x: 3, y: -3},{x: 4, y: -4},{x: 5, y: -5},{x: 6, y: -6},{x: 7, y: -7}],'b','w');
            move3 = side_cross_options(position,[{x: -1, y: 1},{x: -2, y: 2},{x: -3, y: 3},{x: -4, y: 4},{x: -5, y: 5},{x: -6, y: 6},{x: -7, y: 7}],'b','w');
            move4 = side_cross_options(position,[{x: -1, y: -1},{x: -2, y: -2},{x: -3, y: -3},{x: -4, y: -4},{x: -5, y: -5},{x: -6, y: -6},{x: -7, y: -7}],'b','w');
            move5 = side_cross_options(position,[{x: 1, y: 0},{x: 2, y: 0},{x: 3, y: 0},{x: 4, y: 0},{x: 5, y: 0},{x: 6, y: 0},{x: 7, y: 0}],'b','w');
            move6 = side_cross_options(position,[{x: 0, y: 1},{x: 0, y: 2},{x: 0, y: 3},{x: 0, y: 4},{x: 0, y: 5},{x: 0, y: 6},{x: 0, y: 7}],'b','w');
            move7 = side_cross_options(position,[{x: -1, y: 0},{x: -2, y: 0},{x: -3, y: 0},{x: -4, y: 0},{x: -5, y: 0},{x: -6, y: 0},{x: -7, y: 0}],'b','w');
            move8 = side_cross_options(position,[{x: 0, y: -1},{x: 0, y: -2},{x: 0, y: -3},{x: 0, y: -4},{x: 0, y: -5},{x: 0, y: -6},{x: 0, y: -7}],'b','w');
      
                options = move1.concat(move2).concat(move3).concat(move4).concat(move5).concat(move6).concat(move7).concat(move8);
                if(forCheck==true){
                  return options;
                }
              global.variables.highlighted = options;
              console.log(options);
              togglehighlight(options);
       
             break;

      }
    }



    // it is the function to calculate possible moves for pawn ,king, knight and return to moveoptions functions
     function possible_options(startpoint, possible_moves, piecetype) { 
      
      //all moves variable is used for get a all valid and invalid moves 
      let allmoves=possible_moves;
      possible_moves=[];
       
      //check if any move is out of board or not
      let position_1,position_2;
      for(let i=0;i<allmoves.length;i++){
       position_1=parseInt(allmoves[i].split('_')[0]);
       position_2=parseInt(allmoves[i].split('_')[1]);
       if(!(position_1< 1) && !(position_1 > 8) && !(position_2 < 1) && !(position_2 > 8)){
          possible_moves.push(allmoves[i]);
       }
      }

     // console.log("not out of bound "+possible_moves)
      let start_pos1 ,start_pos2 ,single_move;

     //calculate valid moves
      switch (piecetype) {

        case 'w_king':

          allmoves=possible_moves;
          possible_moves=[];
          for(let i=0;i<allmoves.length;i++){
            if($('#' + allmoves[i]).attr('chess') == 'null' || ($('#' + allmoves[i]).attr('chess')).slice(0,1) == 'b'){
              possible_moves.push(allmoves[i]);      
            }
          }


          break;
        case 'b_king':
        
          allmoves=possible_moves;
          possible_moves=[];
          for(let i=0;i<allmoves.length;i++){
            if($('#' + allmoves[i]).attr('chess') == 'null' || ($('#' + allmoves[i]).attr('chess')).slice(0,1) == 'w'){
              possible_moves.push(allmoves[i]);      
            }
          }

          break;
        case 'w_pawn':
             
            allmoves=possible_moves;
            possible_moves=[];
            start_pos1 = startpoint.split('_')[0];
            start_pos2 = startpoint.split('_')[1];

            for(let i=0;i<allmoves.length;i++){
             single_move=allmoves[i].split('_');

             // check if it has an opponent piece on it;
             if (single_move[0] < start_pos1 || single_move[0] > start_pos1){ 
            
              if ($('#' + allmoves[i]).attr('chess') != 'null' && ($('#' + allmoves[i]).attr('chess')).slice(0,1) == 'b'){
                 possible_moves.push(allmoves[i]);    //add possible_moves with opponent pieces on them
                }  
  
            }else{
                if ($('#' + allmoves[i]).attr('chess') == 'null'){

                  possible_moves.push(allmoves[i]);     // otherwise return the move if there is no chess piece on it;

                }   
              }
            }
         
          break;

        case 'b_pawn':
                
          allmoves=possible_moves;
          possible_moves=[];
          start_pos1 = startpoint.split('_')[0];
          start_pos2 = startpoint.split('_')[1];

          for(let i=0;i<allmoves.length;i++){
           single_move=allmoves[i].split('_');

          //check if it has an opponent piece on it;
           if (single_move[0] < start_pos1 || single_move[0] > start_pos1){ 
          
            if ($('#' + allmoves[i]).attr('chess') != 'null' && ($('#' + allmoves[i]).attr('chess')).slice(0,1) == 'w'){
               possible_moves.push(allmoves[i]);    //add possible_moves with opponent pieces on them
              }  

          }else{
              if ($('#' + allmoves[i]).attr('chess') == 'null'){

                possible_moves.push(allmoves[i]);     // otherwise return the move if there is no chess piece on it;

              }   
            }
          }
          
          break;

          case 'w_knight':

            allmoves=possible_moves;
            possible_moves=[];
            for(let i=0;i<allmoves.length;i++){
              if($('#' + allmoves[i]).attr('chess') == 'null' || ($('#' + allmoves[i]).attr('chess')).slice(0,1) == 'b'){
                possible_moves.push(allmoves[i]);      
              }
            }
  
            break;
  
          case 'b_knight':
  
            allmoves=possible_moves;
            possible_moves=[];
            for(let i=0;i<allmoves.length;i++){
              if($('#' + allmoves[i]).attr('chess') == 'null' || ($('#' + allmoves[i]).attr('chess')).slice(0,1) == 'w'){
                possible_moves.push(allmoves[i]);      
              }
            }
  
            break;
            
      }      

      return possible_moves;
    }


      //it is the function calculate moves for white rook, bishop and queen

      function side_cross_options (position,possible_moves,my_icon,opponent_icon) {
      
        let flag = false;
        let all_moves=possible_moves;
        possible_moves=[];
        
        for(let i=0;i<all_moves.length;i++){
         possible_moves.push ((parseInt(position.x) + parseInt(all_moves[i].x)) + '_' + (parseInt(position.y) + parseInt(all_moves[i].y)));
        }
        
        all_moves=possible_moves;
        possible_moves=[];
         
        let position_1,position_2;
        for(let i=0;i<all_moves.length;i++){
         position_1=parseInt(all_moves[i].split('_')[0]);
         position_2=parseInt(all_moves[i].split('_')[1]);
         if(!(position_1< 1) && !(position_1 > 8) && !(position_2 < 1) && !(position_2 > 8)){
            possible_moves.push(all_moves[i]);
         }
        }
        
        all_moves=possible_moves;
        possible_moves=[];
        
        for(let i=0;i<all_moves.length;i++){
           
          if (flag == false){
           if ($('#' + all_moves[i]).attr('chess') == 'null'){
             possible_moves.push(all_moves[i]);
           } else if (($('#' + all_moves[i]).attr('chess')).slice(0,1) == opponent_icon) {
             flag = true;
             possible_moves.push(all_moves[i]);
           } else if (($('#' + all_moves[i]).attr('chess')).slice(0,1) == my_icon) {
             flag = true;
           }
         }
        }
     
        return possible_moves;
          
        }


     //it is the function for move the icon
    function move(target) {

      let selectedpiece = $('#' + global.variables.selectedpiece).attr('chess');     //get the name of selected piece
      let targetpiece= $('#' + target.id).attr('chess');


      let icon = $('#' + global.variables.selectedpiece).html();
      let target_icon=$('#' + target.id).html();
      // new cell
      $('#' + target.id).html(icon);
      //alert(global.variables.selectedpiece);
      $('#' + target.id).attr('chess',selectedpiece);
      // old cell
      $('#' + global.variables.selectedpiece).html('');
      $('#' + global.variables.selectedpiece).attr('chess','null');
      global.variables.pieces[selectedpiece].position = target.id;
      global.variables.pieces[selectedpiece].moved = true;    

      //insert all values in recent array before move 
     global.variables.recent_move_ids.push(global.variables.selectedpiece,target.id);
     global.variables.recent_move_icons.push(icon,target_icon);
     global.variables.recent_move_attr.push(selectedpiece,targetpiece);
    }

    
     //it is the function for capture the icon
    function capture (target) {
      
       // captured piece
      let target_icon=$('#' + target.id).html();
      move(target);
     
     global.variables.pieces[target.name].captured = true;
     if(global.variables.pieces[target.name].type.slice(0,1)=='w'){
             $("#w_captured_piece"+global.variables.w_captured_iteration).html(target_icon);
             global.variables.w_captured_iteration++;
         }else if(global.variables.pieces[target.name].type.slice(0,1)=='b'){
          $("#b_captured_piece"+global.variables.b_captured_iteration).html(target_icon);
          global.variables.b_captured_iteration++;
        }

       
     }



  //it is the function for change the turn
  function endturn(){

      if (global.variables.turn == 'w') {
        global.variables.turn = 'b';
        
        // toggle highlighted moves
        //console.log(global.variables.highlighted);
        togglehighlight(global.variables.highlighted);
        global.variables.highlighted = [];
        // set the selected piece to '' again
        global.variables.selectedpiece = '';
        
        $('.player2').css("background-color","yellow");
        $('.player1').css("background-color","white");
   
    
      } else if (global.variables.turn = 'b'){
        global.variables.turn = 'w';

        // toggle highlighted coordinates
        togglehighlight(global.variables.highlighted);
        global.variables.highlighted = [];

        // set the selected piece to '' again
        global.variables.selectedpiece = '';
       
        $('.player1').css("background-color","yellow");
        $('.player2').css("background-color","white");

      }

    }
  

    //This is the function for highlight the moves in green color 
    function togglehighlight(options) {
      
    for(let i=0;i<options.length;i++){
      $('#' + options[i]).toggleClass("green"); 
    }

    }


       //it is the function for undo operation
       function undo(){
        //alert( global.variables.recent_move_attr +"\n"+ global.variables.recent_move_ids);
       
        if(global.variables.recent_move_attr.length!=0){
  
        togglehighlight(global.variables.highlighted);     //toggle the alredy highlighted options and make empty
    
        recent_move_attr2=global.variables.recent_move_attr.pop();
        recent_move_attr1=global.variables.recent_move_attr.pop();
  
        recent_move_icon2=global.variables.recent_move_icons.pop();
        recent_move_icon1=global.variables.recent_move_icons.pop();
        
        recent_move_id2=global.variables.recent_move_ids.pop();
        recent_move_id1=global.variables.recent_move_ids.pop();
  
        let start_id=[];
        let end_id=[];
  
        $("#"+recent_move_id1).html(recent_move_icon1);
        $("#"+recent_move_id2).html(recent_move_icon2);
  
        $("#"+recent_move_id1).attr('chess',recent_move_attr1);
        $("#"+recent_move_id2).attr('chess',recent_move_attr2);
  
        if(recent_move_attr1!='null'){
         global.variables.pieces[recent_move_attr1].position =recent_move_id1;
         }
        if(recent_move_attr2!='null'){
          global.variables.pieces[recent_move_attr2].position =recent_move_id2;
          }
  
             //check if a undo operation on first pawn move
       if(global.variables.pieces[recent_move_attr1].type=='w_pawn'){
             
        start_id=recent_move_id1.split('_');
  
        if(start_id[1]=='2'){
          global.variables.pieces[recent_move_attr1].moved = false;
        }
      }else if(global.variables.pieces[recent_move_attr1].type=='b_pawn'){
         
      start_id=recent_move_id1.split('_');
  
      if(start_id[1]=='7'){
        global.variables.pieces[recent_move_attr1].moved = false;
       }
      }

      //write a code of undo for captured icons
 
    if(recent_move_attr2!='null'){
      if(global.variables.pieces[recent_move_attr1].type.slice(0,1)=='w'){

        if(global.variables.pieces[recent_move_attr2].captured==true){

          global.variables.b_captured_iteration--;
          $("#b_captured_piece"+global.variables.b_captured_iteration).html('');   
          global.variables.pieces[recent_move_attr2].captured=false;
        }
      
      }else if(global.variables.pieces[recent_move_attr1].type.slice(0,1)=='b'){

        if(global.variables.pieces[recent_move_attr2].captured==true){

          global.variables.w_captured_iteration--;
          $("#w_captured_piece"+global.variables.w_captured_iteration).html('');   
          global.variables.pieces[recent_move_attr2].captured=false;
          
        }

      }

    }
        global.variables.highlighted=[];
        endturn();
        }
      
    }
