; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %16, %2
  %indvars.iv13 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %16 ]
  %3 = trunc i64 %indvars.iv13 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %5 ]
  %6 = trunc i64 %indvars.iv2 to i32
  %7 = sitofp i32 %6 to double
  %8 = fmul double %4, %7
  %9 = fdiv double %8, 1.200000e+03
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv2
  store double %9, double* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv2, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul double %4, %12
  %14 = fdiv double %13, 1.200000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %14, double* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %16, label %5

; <label>:16:                                     ; preds = %5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %16
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #2 {
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr28 = ptrtoint double* %3 to i64
  br label %8

; <label>:8:                                      ; preds = %18, %4
  %indvars.iv1415 = phi i64 [ 0, %4 ], [ %indvars.iv.next15, %18 ]
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv1415
  store double 0.000000e+00, double* %9, align 8
  %sunkaddr25 = shl i64 %indvars.iv1415, 3
  %sunkaddr26 = add i64 %sunkaddr, %sunkaddr25
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to double*
  %sunkaddr25.1 = shl i64 %indvars.iv1415, 3
  %sunkaddr26.1 = add i64 %sunkaddr.1, %sunkaddr25.1
  %sunkaddr27.1 = inttoptr i64 %sunkaddr26.1 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %8
  %11 = phi double [ 0.000000e+00, %8 ], [ %17, %10 ]
  %indvars.iv1214 = phi i64 [ 0, %8 ], [ %indvars.iv.next13.1, %10 ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1214, i64 %indvars.iv1415
  %13 = load double, double* %12, align 8
  %14 = fadd double %11, %13
  store double %14, double* %sunkaddr27, align 8
  %indvars.iv.next13 = or i64 %indvars.iv1214, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next13, i64 %indvars.iv1415
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  store double %17, double* %sunkaddr27.1, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1214, 2
  %exitcond5.1 = icmp eq i64 %indvars.iv.next13.1, 1400
  br i1 %exitcond5.1, label %18, label %10

; <label>:18:                                     ; preds = %10
  %19 = fdiv double %17, %0
  %sunkaddr29 = shl i64 %indvars.iv1415, 3
  %sunkaddr30 = add i64 %sunkaddr28, %sunkaddr29
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to double*
  store double %19, double* %sunkaddr31, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1415, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond6, label %20, label %8

; <label>:20:                                     ; preds = %18
  %scevgep19 = getelementptr double, double* %3, i64 1200
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %middle.block, %20
  %indvars.iv1013 = phi i64 [ 0, %20 ], [ %indvars.iv.next11, %middle.block ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv1013, i64 0
  %21 = add nuw i64 %indvars.iv1013, 1
  %scevgep17 = getelementptr [1200 x double], [1200 x double]* %1, i64 %21, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep19
  %bound1 = icmp ugt double* %scevgep17, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.._crit_edge_crit_edge.._crit_edge_crit_edge, label %.._crit_edge_crit_edge.vector.body_crit_edge

.._crit_edge_crit_edge.vector.body_crit_edge:     ; preds = %.._crit_edge_crit_edge
  br label %vector.body

.._crit_edge_crit_edge.._crit_edge_crit_edge:     ; preds = %.._crit_edge_crit_edge
  br label %._crit_edge

vector.body:                                      ; preds = %vector.body, %.._crit_edge_crit_edge.vector.body_crit_edge
  %index = phi i64 [ 0, %.._crit_edge_crit_edge.vector.body_crit_edge ], [ %index.next.1, %vector.body ]
  %22 = getelementptr inbounds double, double* %3, i64 %index
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1013, i64 %index
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !4, !noalias !1
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !4, !noalias !1
  %30 = fsub <2 x double> %wide.load23, %wide.load
  %31 = fsub <2 x double> %wide.load24, %wide.load22
  %32 = bitcast double* %26 to <2 x double>*
  store <2 x double> %30, <2 x double>* %32, align 8, !alias.scope !4, !noalias !1
  %33 = bitcast double* %28 to <2 x double>*
  store <2 x double> %31, <2 x double>* %33, align 8, !alias.scope !4, !noalias !1
  %index.next = or i64 %index, 4
  %34 = getelementptr inbounds double, double* %3, i64 %index.next
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load22.1 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1013, i64 %index.next
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load23.1 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load24.1 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %42 = fsub <2 x double> %wide.load23.1, %wide.load.1
  %43 = fsub <2 x double> %wide.load24.1, %wide.load22.1
  %44 = bitcast double* %38 to <2 x double>*
  store <2 x double> %42, <2 x double>* %44, align 8, !alias.scope !4, !noalias !1
  %45 = bitcast double* %40 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8, !alias.scope !4, !noalias !1
  %index.next.1 = add nsw i64 %index, 8
  %46 = icmp eq i64 %index.next.1, 1200
  br i1 %46, label %middle.block.loopexit37, label %vector.body, !llvm.loop !6

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge.._crit_edge_crit_edge
  %indvars.iv812 = phi i64 [ 0, %.._crit_edge_crit_edge.._crit_edge_crit_edge ], [ %indvars.iv.next9.3, %._crit_edge ]
  %47 = getelementptr inbounds double, double* %3, i64 %indvars.iv812
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1013, i64 %indvars.iv812
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next9 = or i64 %indvars.iv812, 1
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next9
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1013, i64 %indvars.iv.next9
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next9.1 = or i64 %indvars.iv812, 2
  %57 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next9.1
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1013, i64 %indvars.iv.next9.1
  %60 = load double, double* %59, align 8
  %61 = fsub double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next9.2 = or i64 %indvars.iv812, 3
  %62 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next9.2
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1013, i64 %indvars.iv.next9.2
  %65 = load double, double* %64, align 8
  %66 = fsub double %65, %63
  store double %66, double* %64, align 8
  %indvars.iv.next9.3 = add nsw i64 %indvars.iv812, 4
  %exitcond3.3 = icmp eq i64 %indvars.iv.next9.3, 1200
  br i1 %exitcond3.3, label %middle.block.loopexit, label %._crit_edge, !llvm.loop !9

middle.block.loopexit:                            ; preds = %._crit_edge
  br label %middle.block

middle.block.loopexit37:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit37, %middle.block.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1013, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next11, 1400
  br i1 %exitcond4, label %middle.block..._crit_edge24_crit_edge_crit_edge, label %.._crit_edge_crit_edge

middle.block..._crit_edge24_crit_edge_crit_edge:  ; preds = %middle.block
  br label %.._crit_edge24_crit_edge..lr.ph_crit_edge

.._crit_edge24_crit_edge..lr.ph_crit_edge:        ; preds = %middle.block..._crit_edge24_crit_edge_crit_edge, %._crit_edge24._crit_edge
  %67 = phi [1200 x double]* [ %2, %middle.block..._crit_edge24_crit_edge_crit_edge ], [ %71, %._crit_edge24._crit_edge ]
  %indvars.iv610 = phi i64 [ 0, %middle.block..._crit_edge24_crit_edge_crit_edge ], [ %indvars.iv.next7, %._crit_edge24._crit_edge ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge24, %.._crit_edge24_crit_edge..lr.ph_crit_edge
  %68 = phi [1200 x double]* [ %67, %.._crit_edge24_crit_edge..lr.ph_crit_edge ], [ %71, %._crit_edge24 ]
  %indvars.iv49 = phi i64 [ %indvars.iv610, %.._crit_edge24_crit_edge..lr.ph_crit_edge ], [ %indvars.iv.next5, %._crit_edge24 ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv610, i64 %indvars.iv49
  store double 0.000000e+00, double* %69, align 8
  %70 = load [1200 x double]*, [1200 x double]** %6, align 8
  %71 = load [1200 x double]*, [1200 x double]** %7, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv610, i64 %indvars.iv49
  br label %73

; <label>:73:                                     ; preds = %73, %.lr.ph
  %indvars.iv7 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %73 ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv7, i64 %indvars.iv610
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv7, i64 %indvars.iv49
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = load double, double* %72, align 8
  %80 = fadd double %79, %78
  store double %80, double* %72, align 8
  %indvars.iv.next = or i64 %indvars.iv7, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv.next, i64 %indvars.iv610
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv.next, i64 %indvars.iv49
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = load double, double* %72, align 8
  %87 = fadd double %86, %85
  store double %87, double* %72, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv7, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge24, label %73

._crit_edge24:                                    ; preds = %73
  %88 = load double, double* %5, align 8
  %89 = fadd double %88, -1.000000e+00
  %90 = load double, double* %72, align 8
  %91 = fdiv double %90, %89
  store double %91, double* %72, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv49, i64 %indvars.iv610
  store double %91, double* %92, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond16, label %._crit_edge24._crit_edge, label %.lr.ph

._crit_edge24._crit_edge:                         ; preds = %._crit_edge24
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv610, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond2, label %93, label %.._crit_edge24_crit_edge..lr.ph_crit_edge

; <label>:93:                                     ; preds = %._crit_edge24._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv13 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv13, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge5, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge5 ]
  %8 = add nuw nsw i64 %6, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge5

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond3, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

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
