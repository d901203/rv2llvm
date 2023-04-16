; ModuleID = 'merge.c'
source_filename = "merge.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"\0ASorted array is \0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @merge(ptr noundef %0, i32 noundef signext %1, i32 noundef signext %2, i32 noundef signext %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %17 = load i32, ptr %7, align 4
  %18 = load i32, ptr %6, align 4
  %19 = sub nsw i32 %17, %18
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %12, align 4
  %21 = load i32, ptr %8, align 4
  %22 = load i32, ptr %7, align 4
  %23 = sub nsw i32 %21, %22
  store i32 %23, ptr %13, align 4
  %24 = load i32, ptr %12, align 4
  %25 = zext i32 %24 to i64
  %26 = call ptr @llvm.stacksave()
  store ptr %26, ptr %14, align 8
  %27 = alloca i32, i64 %25, align 4
  store i64 %25, ptr %15, align 8
  %28 = load i32, ptr %13, align 4
  %29 = zext i32 %28 to i64
  %30 = alloca i32, i64 %29, align 4
  store i64 %29, ptr %16, align 8
  store i32 0, ptr %9, align 4
  br label %31

31:                                               ; preds = %46, %4
  %32 = load i32, ptr %9, align 4
  %33 = load i32, ptr %12, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %49

35:                                               ; preds = %31
  %36 = load ptr, ptr %5, align 8
  %37 = load i32, ptr %6, align 4
  %38 = load i32, ptr %9, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr %36, i64 %40
  %42 = load i32, ptr %41, align 4
  %43 = load i32, ptr %9, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %27, i64 %44
  store i32 %42, ptr %45, align 4
  br label %46

46:                                               ; preds = %35
  %47 = load i32, ptr %9, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, ptr %9, align 4
  br label %31, !llvm.loop !6

49:                                               ; preds = %31
  store i32 0, ptr %10, align 4
  br label %50

50:                                               ; preds = %66, %49
  %51 = load i32, ptr %10, align 4
  %52 = load i32, ptr %13, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %69

54:                                               ; preds = %50
  %55 = load ptr, ptr %5, align 8
  %56 = load i32, ptr %7, align 4
  %57 = add nsw i32 %56, 1
  %58 = load i32, ptr %10, align 4
  %59 = add nsw i32 %57, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, ptr %55, i64 %60
  %62 = load i32, ptr %61, align 4
  %63 = load i32, ptr %10, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %30, i64 %64
  store i32 %62, ptr %65, align 4
  br label %66

66:                                               ; preds = %54
  %67 = load i32, ptr %10, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, ptr %10, align 4
  br label %50, !llvm.loop !8

69:                                               ; preds = %50
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  %70 = load i32, ptr %6, align 4
  store i32 %70, ptr %11, align 4
  br label %71

71:                                               ; preds = %113, %69
  %72 = load i32, ptr %9, align 4
  %73 = load i32, ptr %12, align 4
  %74 = icmp slt i32 %72, %73
  br i1 %74, label %75, label %79

75:                                               ; preds = %71
  %76 = load i32, ptr %10, align 4
  %77 = load i32, ptr %13, align 4
  %78 = icmp slt i32 %76, %77
  br label %79

79:                                               ; preds = %75, %71
  %80 = phi i1 [ false, %71 ], [ %78, %75 ]
  br i1 %80, label %81, label %116

81:                                               ; preds = %79
  %82 = load i32, ptr %9, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, ptr %27, i64 %83
  %85 = load i32, ptr %84, align 4
  %86 = load i32, ptr %10, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, ptr %30, i64 %87
  %89 = load i32, ptr %88, align 4
  %90 = icmp sle i32 %85, %89
  br i1 %90, label %91, label %102

91:                                               ; preds = %81
  %92 = load i32, ptr %9, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, ptr %27, i64 %93
  %95 = load i32, ptr %94, align 4
  %96 = load ptr, ptr %5, align 8
  %97 = load i32, ptr %11, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, ptr %96, i64 %98
  store i32 %95, ptr %99, align 4
  %100 = load i32, ptr %9, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, ptr %9, align 4
  br label %113

102:                                              ; preds = %81
  %103 = load i32, ptr %10, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, ptr %30, i64 %104
  %106 = load i32, ptr %105, align 4
  %107 = load ptr, ptr %5, align 8
  %108 = load i32, ptr %11, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, ptr %107, i64 %109
  store i32 %106, ptr %110, align 4
  %111 = load i32, ptr %10, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %10, align 4
  br label %113

113:                                              ; preds = %102, %91
  %114 = load i32, ptr %11, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, ptr %11, align 4
  br label %71, !llvm.loop !9

116:                                              ; preds = %79
  br label %117

117:                                              ; preds = %121, %116
  %118 = load i32, ptr %9, align 4
  %119 = load i32, ptr %12, align 4
  %120 = icmp slt i32 %118, %119
  br i1 %120, label %121, label %134

121:                                              ; preds = %117
  %122 = load i32, ptr %9, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, ptr %27, i64 %123
  %125 = load i32, ptr %124, align 4
  %126 = load ptr, ptr %5, align 8
  %127 = load i32, ptr %11, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, ptr %126, i64 %128
  store i32 %125, ptr %129, align 4
  %130 = load i32, ptr %9, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %9, align 4
  %132 = load i32, ptr %11, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, ptr %11, align 4
  br label %117, !llvm.loop !10

134:                                              ; preds = %117
  br label %135

135:                                              ; preds = %139, %134
  %136 = load i32, ptr %10, align 4
  %137 = load i32, ptr %13, align 4
  %138 = icmp slt i32 %136, %137
  br i1 %138, label %139, label %152

139:                                              ; preds = %135
  %140 = load i32, ptr %10, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, ptr %30, i64 %141
  %143 = load i32, ptr %142, align 4
  %144 = load ptr, ptr %5, align 8
  %145 = load i32, ptr %11, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, ptr %144, i64 %146
  store i32 %143, ptr %147, align 4
  %148 = load i32, ptr %10, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, ptr %10, align 4
  %150 = load i32, ptr %11, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, ptr %11, align 4
  br label %135, !llvm.loop !11

152:                                              ; preds = %135
  %153 = load ptr, ptr %14, align 8
  call void @llvm.stackrestore(ptr %153)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @mergeSort(ptr noundef %0, i32 noundef signext %1, i32 noundef signext %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %6, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %29

11:                                               ; preds = %3
  %12 = load i32, ptr %5, align 4
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %5, align 4
  %15 = sub nsw i32 %13, %14
  %16 = sdiv i32 %15, 2
  %17 = add nsw i32 %12, %16
  store i32 %17, ptr %7, align 4
  %18 = load ptr, ptr %4, align 8
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %7, align 4
  call void @mergeSort(ptr noundef %18, i32 noundef signext %19, i32 noundef signext %20)
  %21 = load ptr, ptr %4, align 8
  %22 = load i32, ptr %7, align 4
  %23 = add nsw i32 %22, 1
  %24 = load i32, ptr %6, align 4
  call void @mergeSort(ptr noundef %21, i32 noundef signext %23, i32 noundef signext %24)
  %25 = load ptr, ptr %4, align 8
  %26 = load i32, ptr %5, align 4
  %27 = load i32, ptr %7, align 4
  %28 = load i32, ptr %6, align 4
  call void @merge(ptr noundef %25, i32 noundef signext %26, i32 noundef signext %27, i32 noundef signext %28)
  br label %29

29:                                               ; preds = %11, %3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printArray(ptr noundef %0, i32 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %17, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %20

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef signext %15)
  br label %17

17:                                               ; preds = %10
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, ptr %5, align 4
  br label %6, !llvm.loop !12

20:                                               ; preds = %6
  %21 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare dso_local signext i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 10001, ptr %2, align 4
  %6 = load i32, ptr %2, align 4
  %7 = zext i32 %6 to i64
  %8 = call ptr @llvm.stacksave()
  store ptr %8, ptr %3, align 8
  %9 = alloca i32, i64 %7, align 4
  store i64 %7, ptr %4, align 8
  %10 = load i32, ptr %2, align 4
  %11 = sub nsw i32 %10, 1
  store i32 %11, ptr %5, align 4
  br label %12

12:                                               ; preds = %20, %0
  %13 = load i32, ptr %5, align 4
  %14 = icmp sge i32 %13, 0
  br i1 %14, label %15, label %23

15:                                               ; preds = %12
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %5, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr %9, i64 %18
  store i32 %16, ptr %19, align 4
  br label %20

20:                                               ; preds = %15
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, -1
  store i32 %22, ptr %5, align 4
  br label %12, !llvm.loop !13

23:                                               ; preds = %12
  %24 = load i32, ptr %2, align 4
  %25 = sub nsw i32 %24, 1
  call void @mergeSort(ptr noundef %9, i32 noundef signext 0, i32 noundef signext %25)
  %26 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %27 = load i32, ptr %2, align 4
  call void @printArray(ptr noundef %9, i32 noundef signext %27)
  store i32 0, ptr %1, align 4
  %28 = load ptr, ptr %3, align 8
  call void @llvm.stackrestore(ptr %28)
  %29 = load i32, ptr %1, align 4
  ret i32 %29
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+m,+relax,-a,-c,-d,-e,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-experimental-zvkb,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksh,-f,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicsr,-zifencei,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+m,+relax,-a,-c,-d,-e,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-experimental-zvkb,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksh,-f,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicsr,-zifencei,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64"}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{i32 8, !"SmallDataLimit", i32 8}
!5 = !{!"clang version 17.0.0 (https://github.com/llvm/llvm-project.git 2db031528e3e0e2d6ab6087af9bae9e0ccbdfc06)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
