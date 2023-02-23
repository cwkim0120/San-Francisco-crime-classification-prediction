실행방법
1.sanfrancisco crime classification.R 프로그램을 실행시킵니다.

2. 코드 11,12,13줄에 read_csv파일경로를 train.csv와 test.csv가 존재하는 파일경로로 수정해줍니다.
   (visual 변수는 train.csv의 시각화를 위해 존재하니 train.csv가 존재하는 경로로 설정해주면 됩니다.
   저의 경우는 바탕화면에 datamining이란 폴더를 생성하여 그 안에 test.csv와 train.csv를 넣어주었습니다.

3. code를 실행시킵니다.

4-1. 코드 91,92줄에서 생성되는 train2.csv와 test2.csv의 파일경로를 코드 99,102줄에 넣어 수정해줘야 h2o로 파일이 업로드될수있습니다.
   (경로를 따로 지정하지 않는 경우 train2.csv와 test2.csv는 train.csv와 test.csv가 존재하는 곳에 생성될 것입니다.)

4-2. 코드136줄 pred부분에서 address2부분이 학습되지 못했다는 경고문이 나오는데 이는 전처리과정에서 'of'와 '/'를 기준으로 address를
      나눌 때 test.csv address의 일부분이 'of'와 '/'로 구분되지 않는 경우가 있기 때문입니다. 전체 데이터중 극소수여서 prediction의 엄청 큰
      영향을 주지않는다고 판단하여 그대로 전처리과정을 진행하였습니다.

5. code가 모두 실행되고 난 뒤 h2o web UI를 사용하기 위해서 인터넷주소창에 " http://localhost:54321/ "를 입력합니다.

6. web상에서 h2o로 업로드 된 자료(ex.train.csv, test.csv)를 보고 싶다면 getFrames 버튼을 누르고 원하는 파일을 선택합니다.

7. web상에서 생성된 예측모델을 보고 싶다면 getModels를 누르고 원하는 모델을 선택합니다.
   (초기에는 R의 코드를 이용해 생성한 DNN모델만 존재할것입니다.)

8. 기타 다른 모델로 예측모델을 생성하고싶다면 buildModels버튼을 누른뒤 parameter를 설정해주면 됩니다.

9. 다른 모델을 이용해 prediction을 하고싶다면 prediction버튼을 누르고 딥러닝모델, train data, test data 를 설정해주고 실행시킵니다.

   이외에 H2O web UI에 대한 자세한 사용법은 https://docs.h2o.ai/h2o/latest-stable/h2o-docs/flow.html 를 통해 확인할수있습니다.

   감사합니다. :)