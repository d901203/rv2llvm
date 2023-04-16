; ModuleID = 'heap.c'
source_filename = "heap.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Sorted array is\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @swap(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr %5, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = load i32, ptr %8, align 4
  %10 = load ptr, ptr %3, align 8
  store i32 %9, ptr %10, align 4
  %11 = load i32, ptr %5, align 4
  %12 = load ptr, ptr %4, align 8
  store i32 %11, ptr %12, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @heapify(ptr noundef %0, i32 noundef signext %1, i32 noundef signext %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load i32, ptr %6, align 4
  store i32 %10, ptr %7, align 4
  %11 = load i32, ptr %6, align 4
  %12 = mul nsw i32 2, %11
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %8, align 4
  %14 = load i32, ptr %6, align 4
  %15 = mul nsw i32 2, %14
  %16 = add nsw i32 %15, 2
  store i32 %16, ptr %9, align 4
  %17 = load i32, ptr %8, align 4
  %18 = load i32, ptr %5, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %34

20:                                               ; preds = %3
  %21 = load ptr, ptr %4, align 8
  %22 = load i32, ptr %8, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, ptr %21, i64 %23
  %25 = load i32, ptr %24, align 4
  %26 = load ptr, ptr %4, align 8
  %27 = load i32, ptr %7, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr %26, i64 %28
  %30 = load i32, ptr %29, align 4
  %31 = icmp sgt i32 %25, %30
  br i1 %31, label %32, label %34

32:                                               ; preds = %20
  %33 = load i32, ptr %8, align 4
  store i32 %33, ptr %7, align 4
  br label %34

34:                                               ; preds = %32, %20, %3
  %35 = load i32, ptr %9, align 4
  %36 = load i32, ptr %5, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %52

38:                                               ; preds = %34
  %39 = load ptr, ptr %4, align 8
  %40 = load i32, ptr %9, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, ptr %39, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = load ptr, ptr %4, align 8
  %45 = load i32, ptr %7, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr %44, i64 %46
  %48 = load i32, ptr %47, align 4
  %49 = icmp sgt i32 %43, %48
  br i1 %49, label %50, label %52

50:                                               ; preds = %38
  %51 = load i32, ptr %9, align 4
  store i32 %51, ptr %7, align 4
  br label %52

52:                                               ; preds = %50, %38, %34
  %53 = load i32, ptr %7, align 4
  %54 = load i32, ptr %6, align 4
  %55 = icmp ne i32 %53, %54
  br i1 %55, label %56, label %68

56:                                               ; preds = %52
  %57 = load ptr, ptr %4, align 8
  %58 = load i32, ptr %6, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %57, i64 %59
  %61 = load ptr, ptr %4, align 8
  %62 = load i32, ptr %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr %61, i64 %63
  call void @swap(ptr noundef %60, ptr noundef %64)
  %65 = load ptr, ptr %4, align 8
  %66 = load i32, ptr %5, align 4
  %67 = load i32, ptr %7, align 4
  call void @heapify(ptr noundef %65, i32 noundef signext %66, i32 noundef signext %67)
  br label %68

68:                                               ; preds = %56, %52
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @heapSort(ptr noundef %0, i32 noundef signext %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = sdiv i32 %7, 2
  %9 = sub nsw i32 %8, 1
  store i32 %9, ptr %5, align 4
  br label %10

10:                                               ; preds = %17, %2
  %11 = load i32, ptr %5, align 4
  %12 = icmp sge i32 %11, 0
  br i1 %12, label %13, label %20

13:                                               ; preds = %10
  %14 = load ptr, ptr %3, align 8
  %15 = load i32, ptr %4, align 4
  %16 = load i32, ptr %5, align 4
  call void @heapify(ptr noundef %14, i32 noundef signext %15, i32 noundef signext %16)
  br label %17

17:                                               ; preds = %13
  %18 = load i32, ptr %5, align 4
  %19 = add nsw i32 %18, -1
  store i32 %19, ptr %5, align 4
  br label %10, !llvm.loop !6

20:                                               ; preds = %10
  %21 = load i32, ptr %4, align 4
  %22 = sub nsw i32 %21, 1
  store i32 %22, ptr %6, align 4
  br label %23

23:                                               ; preds = %35, %20
  %24 = load i32, ptr %6, align 4
  %25 = icmp sge i32 %24, 0
  br i1 %25, label %26, label %38

26:                                               ; preds = %23
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds i32, ptr %27, i64 0
  %29 = load ptr, ptr %3, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  call void @swap(ptr noundef %28, ptr noundef %32)
  %33 = load ptr, ptr %3, align 8
  %34 = load i32, ptr %6, align 4
  call void @heapify(ptr noundef %33, i32 noundef signext %34, i32 noundef signext 0)
  br label %35

35:                                               ; preds = %26
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, -1
  store i32 %37, ptr %6, align 4
  br label %23, !llvm.loop !8

38:                                               ; preds = %23
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
  br label %6, !llvm.loop !9

20:                                               ; preds = %6
  %21 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare dso_local signext i32 @printf(ptr noundef, ...) #1

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
  br label %12, !llvm.loop !10

23:                                               ; preds = %12
  %24 = load i32, ptr %2, align 4
  call void @heapSort(ptr noundef %9, i32 noundef signext %24)
  %25 = call signext i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %26 = load i32, ptr %2, align 4
  call void @printArray(ptr noundef %9, i32 noundef signext %26)
  %27 = load ptr, ptr %3, align 8
  call void @llvm.stackrestore(ptr %27)
  %28 = load i32, ptr %1, align 4
  ret i32 %28
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+m,+relax,-a,-c,-d,-e,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-experimental-zvkb,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksh,-f,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicsr,-zifencei,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+m,+relax,-a,-c,-d,-e,-experimental-zca,-experimental-zcb,-experimental-zcd,-experimental-zcf,-experimental-zfa,-experimental-zicond,-experimental-zihintntl,-experimental-ztso,-experimental-zvfh,-experimental-zvkb,-experimental-zvkg,-experimental-zvkn,-experimental-zvkned,-experimental-zvknha,-experimental-zvknhb,-experimental-zvks,-experimental-zvksed,-experimental-zvksh,-f,-h,-save-restore,-svinval,-svnapot,-svpbmt,-v,-xsfvcp,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zdinx,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zicbom,-zicbop,-zicboz,-zicsr,-zifencei,-zihintpause,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { nocallback nofree nosync nounwind willreturn }

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
