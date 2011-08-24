/**
 * CharacterView defines the UI for interactions with the non-playable characters.
 * This consists of a character image, a location image (bg), and character dialogue
 * @author dcloud
 * @version $Rev$
 */

(function() {
    st.ui.createCharacterView = function(_args) {
        var cv = Ti.UI.createView(st.mixin($$.fullscreen, {
            center: $$.Slide.Out.center
        }));
        cv.height = $$.fullscreen.height;
        cv.width = $$.fullscreen.width;
        cv.center = $$.Slide.Out.center;
        
        var locationImage = Ti.UI.createImageView({
            image: _args.locationImage||null
        });
        cv.add(locationImage);
        
        var characterImage = Ti.UI.createImageView(st.mixin($$.Character.CharacterImage, {
            image: _args.character.characterImage||''
        }));
        cv.add(characterImage);
        
        
        var dialogueScroll = Ti.UI.createScrollView($$.Character.DialogueBox);
        var dialogueLabel = Ti.UI.createLabel(st.mixin($$.Character.Dialogue, {
            text: _args.character.dialogue||'',
            height: 'auto'
        }));
        var dialogueView = Ti.UI.createView({
            height: 'auto',
            top: 0
        });
        dialogueView.add(dialogueLabel);

        var actionButtonLabel = Ti.UI.createLabel(st.mixin($$.Button,{
            text: _args.actionLabel,
            left: $$.Button.padding
        }));
        var actionButton = Ti.UI.createView(st.combine($$.Button, {
            height: 'auto',
            width: dialogueScroll.width- $$.Button.padding*4,
            top: 10,
            bottom: 5
        }));
        actionButton.add(actionButtonLabel);
        
        function actionButtonClick (e) {
            actionButton.removeEventListener('click', actionButtonClick);
            // Ti.API.log('CharacterView.actionButtonClick _args', _args);
            Ti.App.fireEvent('st.ui.CharacterView:ActionButtonClick', {
                actionType: _args.actionType
            });
        }
        actionButton.addEventListener('click', actionButtonClick);
        
        dialogueScroll.add(dialogueView);
        dialogueScroll.add(actionButton);
        cv.add(dialogueScroll);

        var characterNameTag = Ti.UI.createLabel(st.mixin($$.Character.NameTag.Label, {
            text: _args.character.characterName||''
        }));
        var nameTagView = Ti.UI.createView(st.mixin($$.Character.NameTag.Backing, {
            height: characterNameTag.toImage().height + $$.Character.NameTag.Backing.padding/2,
            width: characterNameTag.toImage().width + $$.Character.NameTag.Backing.padding,
            bottom: dialogueScroll.height + 4
        }));
        nameTagView.add(characterNameTag);
        cv.add(nameTagView);
        
        return cv;
    };
}());
