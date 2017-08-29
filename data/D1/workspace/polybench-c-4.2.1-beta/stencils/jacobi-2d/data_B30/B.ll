; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %5 = bitcast i8* %3 to [1300 x double]*
  %6 = bitcast i8* %4 to [1300 x double]*
  tail call void @init_array([1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [1300 x double]*
  %8 = bitcast i8* %4 to [1300 x double]*
  tail call void @kernel_jacobi_2d([1300 x double]* %7, [1300 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call void @print_array([1300 x double]* %7)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1300 x double]*, [1300 x double]*) #2 {
  br label %.preheader

.preheader:                                       ; preds = %20, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %20 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %5 ]
  %6 = add nuw nsw i64 %indvars.iv, 2
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %4, %8
  %10 = fadd double %9, 2.000000e+00
  %11 = fdiv double %10, 1.300000e+03
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  store double %11, double* %12, align 8
  %13 = add nuw nsw i64 %indvars.iv, 3
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %4, %15
  %17 = fadd double %16, 3.000000e+00
  %18 = fdiv double %17, 1.300000e+03
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %20, label %5

; <label>:20:                                     ; preds = %5
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1300
  br i1 %exitcond5, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_2d([1300 x double]*, [1300 x double]*) #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %117, %2
  %storemerge8 = phi i32 [ 0, %2 ], [ %118, %117 ]
  br label %.preheader1

.preheader1:                                      ; preds = %.loopexit76, %.preheader3
  %indvar41 = phi i64 [ %indvar.next42, %.loopexit76 ], [ 0, %.preheader3 ]
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %.loopexit76 ], [ 1, %.preheader3 ]
  %3 = add i64 %indvar41, 1
  %scevgep43 = getelementptr [1300 x double], [1300 x double]* %1, i64 %3, i64 1
  %scevgep45 = getelementptr [1300 x double], [1300 x double]* %1, i64 %3, i64 1299
  %scevgep47 = getelementptr [1300 x double], [1300 x double]* %0, i64 %indvar41, i64 1
  %4 = add i64 %indvar41, 2
  %scevgep49 = getelementptr [1300 x double], [1300 x double]* %0, i64 %4, i64 1299
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %5 = add nsw i64 %indvars.iv9, -1
  %bound051 = icmp ult double* %scevgep43, %scevgep49
  %bound152 = icmp ult double* %scevgep47, %scevgep45
  %memcheck.conflict54 = and i1 %bound051, %bound152
  br i1 %memcheck.conflict54, label %scalar.ph38.preheader, label %vector.body36.preheader

vector.body36.preheader:                          ; preds = %.preheader1
  br label %vector.body36

vector.body36:                                    ; preds = %vector.body36.preheader, %vector.body36
  %index57 = phi i64 [ %index.next58, %vector.body36 ], [ 0, %vector.body36.preheader ]
  %offset.idx61 = or i64 %index57, 1
  %6 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv9, i64 %offset.idx61
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = add nsw i64 %offset.idx61, -1
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv9, i64 %10
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fadd <2 x double> %wide.load66, %wide.load68
  %16 = fadd <2 x double> %wide.load67, %wide.load69
  %17 = add nuw nsw i64 %offset.idx61, 1
  %18 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv9, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %15, %wide.load70
  %23 = fadd <2 x double> %16, %wide.load71
  %24 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv.next10, i64 %offset.idx61
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %22, %wide.load72
  %29 = fadd <2 x double> %23, %wide.load73
  %30 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %5, i64 %offset.idx61
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %28, %wide.load74
  %35 = fadd <2 x double> %29, %wide.load75
  %36 = fmul <2 x double> %34, <double 2.000000e-01, double 2.000000e-01>
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv9, i64 %offset.idx61
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %36, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %37, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %index.next58 = add i64 %index57, 4
  %42 = icmp eq i64 %index.next58, 1296
  br i1 %42, label %scalar.ph38.preheader.loopexit, label %vector.body36, !llvm.loop !6

scalar.ph38.preheader.loopexit:                   ; preds = %vector.body36
  br label %scalar.ph38.preheader

scalar.ph38.preheader:                            ; preds = %scalar.ph38.preheader.loopexit, %.preheader1
  %indvars.iv.ph = phi i64 [ 1, %.preheader1 ], [ 1297, %scalar.ph38.preheader.loopexit ]
  br label %scalar.ph38

scalar.ph38:                                      ; preds = %scalar.ph38.preheader, %scalar.ph38
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph38 ], [ %indvars.iv.ph, %scalar.ph38.preheader ]
  %43 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv9, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = add nsw i64 %indvars.iv, -1
  %46 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv9, i64 %45
  %47 = load double, double* %46, align 8
  %48 = fadd double %44, %47
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv9, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv.next10, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fadd double %51, %53
  %55 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %5, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = fmul double %57, 2.000000e-01
  %59 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  store double %58, double* %59, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %.loopexit76, label %scalar.ph38, !llvm.loop !9

.loopexit76:                                      ; preds = %scalar.ph38
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1299
  %indvar.next42 = add i64 %indvar41, 1
  br i1 %exitcond11, label %.preheader.preheader, label %.preheader1

.preheader.preheader:                             ; preds = %.loopexit76
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvar = phi i64 [ %indvar.next, %.loopexit ], [ 0, %.preheader.preheader ]
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %.loopexit ], [ 1, %.preheader.preheader ]
  %60 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %0, i64 %60, i64 1
  %scevgep20 = getelementptr [1300 x double], [1300 x double]* %0, i64 %60, i64 1299
  %scevgep22 = getelementptr [1300 x double], [1300 x double]* %1, i64 %indvar, i64 1
  %61 = add i64 %indvar, 2
  %scevgep24 = getelementptr [1300 x double], [1300 x double]* %1, i64 %61, i64 1299
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %62 = add nsw i64 %indvars.iv15, -1
  %bound0 = icmp ult double* %scevgep, %scevgep24
  %bound1 = icmp ult double* %scevgep22, %scevgep20
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %63 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv15, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10
  %67 = add nsw i64 %offset.idx, -1
  %68 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv15, i64 %67
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load28 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = fadd <2 x double> %wide.load, %wide.load28
  %73 = fadd <2 x double> %wide.load27, %wide.load29
  %74 = add nuw nsw i64 %offset.idx, 1
  %75 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv15, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load31 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = fadd <2 x double> %72, %wide.load30
  %80 = fadd <2 x double> %73, %wide.load31
  %81 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv.next16, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fadd <2 x double> %79, %wide.load32
  %86 = fadd <2 x double> %80, %wide.load33
  %87 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %62, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %85, %wide.load34
  %92 = fadd <2 x double> %86, %wide.load35
  %93 = fmul <2 x double> %91, <double 2.000000e-01, double 2.000000e-01>
  %94 = fmul <2 x double> %92, <double 2.000000e-01, double 2.000000e-01>
  %95 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv15, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  store <2 x double> %93, <2 x double>* %96, align 8, !alias.scope !13, !noalias !10
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x double>*
  store <2 x double> %94, <2 x double>* %98, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %99 = icmp eq i64 %index.next, 1296
  br i1 %99, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !15

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader
  %indvars.iv12.ph = phi i64 [ 1, %.preheader ], [ 1297, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %scalar.ph ], [ %indvars.iv12.ph, %scalar.ph.preheader ]
  %100 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv12
  %101 = load double, double* %100, align 8
  %102 = add nsw i64 %indvars.iv12, -1
  %103 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv15, i64 %102
  %104 = load double, double* %103, align 8
  %105 = fadd double %101, %104
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %106 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv.next13
  %107 = load double, double* %106, align 8
  %108 = fadd double %105, %107
  %109 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv.next16, i64 %indvars.iv12
  %110 = load double, double* %109, align 8
  %111 = fadd double %108, %110
  %112 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %62, i64 %indvars.iv12
  %113 = load double, double* %112, align 8
  %114 = fadd double %111, %113
  %115 = fmul double %114, 2.000000e-01
  %116 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv12
  store double %115, double* %116, align 8
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1299
  br i1 %exitcond14, label %.loopexit, label %scalar.ph, !llvm.loop !16

.loopexit:                                        ; preds = %scalar.ph
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1299
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond17, label %117, label %.preheader

; <label>:117:                                    ; preds = %.loopexit
  %118 = add nuw nsw i32 %storemerge8, 1
  %exitcond18 = icmp eq i32 %118, 500
  br i1 %exitcond18, label %119, label %.preheader3

; <label>:119:                                    ; preds = %117
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1300 x double]*) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv3, 1300
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %7, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1300
  br i1 %exitcond5, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
