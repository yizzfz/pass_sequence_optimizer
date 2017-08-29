; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader14.preheader.lr.ph, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %.preheader8._crit_edge

.preheader14.preheader.lr.ph:                     ; preds = %2
  br label %.preheader14.preheader

.preheader14.preheader:                           ; preds = %.preheader13._crit_edge, %.preheader14.preheader.lr.ph
  %indvars.iv4587 = phi i64 [ 1, %.preheader14.preheader.lr.ph ], [ %indvars.iv.next46, %.preheader13._crit_edge ]
  %indvars.iv4786 = phi i64 [ 0, %.preheader14.preheader.lr.ph ], [ %indvars.iv.next48, %.preheader13._crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv4786, 2001
  %5 = add nuw nsw i64 %4, 1
  br label %.preheader14

.preheader13.preheader:                           ; preds = %.preheader14
  %scevgep97 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %6 = mul nsw i64 %indvars.iv4786, -8
  %scevgep9798 = bitcast double* %scevgep97 to i8*
  %7 = add nsw i64 15992, %6
  %exitcond4483 = icmp eq i64 %indvars.iv4786, 1999
  br i1 %exitcond4483, label %.preheader13._crit_edge, label %.preheader13._crit_edge.loopexit

.preheader14:                                     ; preds = %.preheader14, %.preheader14.preheader
  %indvars.iv3381 = phi i64 [ 0, %.preheader14.preheader ], [ %indvars.iv.next34, %.preheader14 ]
  %8 = sub nsw i64 0, %indvars.iv3381
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4786, i64 %indvars.iv3381
  store double %13, double* %14, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3381, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %indvars.iv4587
  br i1 %exitcond38, label %.preheader13.preheader, label %.preheader14

.preheader13._crit_edge.loopexit:                 ; preds = %.preheader13.preheader
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9798, i8 0, i64 %7, i32 8, i1 false)
  br label %.preheader13._crit_edge

.preheader13._crit_edge:                          ; preds = %.preheader13.preheader, %.preheader13._crit_edge.loopexit
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4786, i64 %indvars.iv4786
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv4786, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next48, 2000
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4587, 1
  br i1 %exitcond99, label %._crit_edge, label %.preheader14.preheader

._crit_edge:                                      ; preds = %.preheader13._crit_edge
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %.preheader12._crit_edge.prol.loopexit, label %.preheader12._crit_edge.prol.preheader

.preheader12._crit_edge.prol.preheader:           ; preds = %._crit_edge
  br label %.preheader12._crit_edge.prol

.preheader12._crit_edge.prol:                     ; preds = %.preheader12._crit_edge.prol, %.preheader12._crit_edge.prol.preheader
  %indvars.iv3179.prol = phi i64 [ 0, %.preheader12._crit_edge.prol.preheader ], [ %indvars.iv.next32.prol, %.preheader12._crit_edge.prol ]
  %prol.iter150 = phi i64 [ 0, %.preheader12._crit_edge.prol.preheader ], [ %prol.iter150.sub, %.preheader12._crit_edge.prol ]
  %17 = mul nuw nsw i64 %indvars.iv3179.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.prol = add nuw nsw i64 %indvars.iv3179.prol, 1
  %prol.iter150.sub = add nsw i64 %prol.iter150, -1
  %prol.iter150.cmp = icmp eq i64 %prol.iter150.sub, 0
  br i1 %prol.iter150.cmp, label %.preheader12._crit_edge.prol.loopexit.unr-lcssa, label %.preheader12._crit_edge.prol, !llvm.loop !1

.preheader12._crit_edge.prol.loopexit.unr-lcssa:  ; preds = %.preheader12._crit_edge.prol
  br label %.preheader12._crit_edge.prol.loopexit

.preheader12._crit_edge.prol.loopexit:            ; preds = %._crit_edge, %.preheader12._crit_edge.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader12._crit_edge.prol.loopexit..preheader10.preheader.preheader_crit_edge, label %._crit_edge.new

.preheader12._crit_edge.prol.loopexit..preheader10.preheader.preheader_crit_edge: ; preds = %.preheader12._crit_edge.prol.loopexit
  br label %.preheader10.preheader.preheader

._crit_edge.new:                                  ; preds = %.preheader12._crit_edge.prol.loopexit
  br label %.preheader12._crit_edge

.preheader10.preheader.preheader.unr-lcssa:       ; preds = %.preheader12._crit_edge
  br label %.preheader10.preheader.preheader

.preheader10.preheader.preheader:                 ; preds = %.preheader12._crit_edge.prol.loopexit..preheader10.preheader.preheader_crit_edge, %.preheader10.preheader.preheader.unr-lcssa
  %18 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader9.preheader.preheader

.preheader12._crit_edge:                          ; preds = %.preheader12._crit_edge, %._crit_edge.new
  %indvars.iv3179 = phi i64 [ 0, %._crit_edge.new ], [ %indvars.iv.next32.7, %.preheader12._crit_edge ]
  %19 = mul i64 %indvars.iv3179, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %20 = add i64 %19, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %21 = add i64 %19, 32000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %22 = add i64 %19, 48000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %23 = add i64 %19, 64000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %24 = add i64 %19, 80000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %25 = add i64 %19, 96000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %26 = add i64 %19, 112000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.7 = add nuw nsw i64 %indvars.iv3179, 8
  %exitcond96.7 = icmp eq i64 %indvars.iv.next32.7, 2000
  br i1 %exitcond96.7, label %.preheader10.preheader.preheader.unr-lcssa, label %.preheader12._crit_edge

.preheader9.preheader.preheader:                  ; preds = %.preheader11, %.preheader10.preheader.preheader
  %indvars.iv2559 = phi i64 [ 0, %.preheader10.preheader.preheader ], [ %indvars.iv.next26, %.preheader11 ]
  %scevgep103 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv2559
  %scevgep103104 = bitcast double* %scevgep103 to i8*
  %27 = add nsw i64 %indvars.iv2559, -1999
  %scevgep105 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %27
  %scevgep105106 = bitcast double* %scevgep105 to i8*
  br label %.preheader9.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader11
  br label %.preheader.preheader

.preheader9.preheader:                            ; preds = %.preheader10, %.preheader9.preheader.preheader
  %indvars.iv2157 = phi i64 [ 0, %.preheader9.preheader.preheader ], [ %indvars.iv.next22, %.preheader10 ]
  %28 = mul nuw nsw i64 %indvars.iv2157, 16000
  %scevgep101 = getelementptr i8, i8* %16, i64 %28
  %29 = add i64 16000, %28
  %scevgep102 = getelementptr i8, i8* %16, i64 %29
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2157, i64 %indvars.iv2559
  br i1 false, label %.preheader9.preheader..preheader9.preheader145_crit_edge, label %min.iters.checked

.preheader9.preheader..preheader9.preheader145_crit_edge: ; preds = %.preheader9.preheader
  br label %.preheader9.preheader145

min.iters.checked:                                ; preds = %.preheader9.preheader
  br i1 false, label %min.iters.checked..preheader9.preheader145_crit_edge, label %vector.memcheck

min.iters.checked..preheader9.preheader145_crit_edge: ; preds = %min.iters.checked
  br label %.preheader9.preheader145

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep101, %scevgep105106
  %bound1 = icmp ult i8* %scevgep103104, %scevgep102
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %30 to i8*
  %bound0108 = icmp ult i8* %scevgep101, %bc
  %bound1109 = icmp ult i8* %bc, %scevgep102
  %found.conflict110 = and i1 %bound0108, %bound1109
  %conflict.rdx = or i1 %found.conflict, %found.conflict110
  br i1 %conflict.rdx, label %.preheader9.preheader145, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %31 = or i64 %index, 1
  %32 = or i64 %index, 2
  %33 = or i64 %index, 3
  %34 = load double, double* %30, align 8, !alias.scope !3
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv2559
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %31, i64 %indvars.iv2559
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %32, i64 %indvars.iv2559
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %33, i64 %indvars.iv2559
  %41 = load double, double* %37, align 8, !alias.scope !6
  %42 = load double, double* %38, align 8, !alias.scope !6
  %43 = load double, double* %39, align 8, !alias.scope !6
  %44 = load double, double* %40, align 8, !alias.scope !6
  %45 = insertelement <2 x double> undef, double %41, i32 0
  %46 = insertelement <2 x double> %45, double %42, i32 1
  %47 = insertelement <2 x double> undef, double %43, i32 0
  %48 = insertelement <2 x double> %47, double %44, i32 1
  %49 = fmul <2 x double> %36, %46
  %50 = fmul <2 x double> %36, %48
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv2157, i64 %index
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !8, !noalias !10
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !8, !noalias !10
  %55 = fadd <2 x double> %wide.load, %49
  %56 = fadd <2 x double> %wide.load112, %50
  store <2 x double> %55, <2 x double>* %52, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %56, <2 x double>* %54, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %57 = icmp eq i64 %index.next, 2000
  br i1 %57, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %.preheader10, label %middle.block..preheader9.preheader145_crit_edge

middle.block..preheader9.preheader145_crit_edge:  ; preds = %middle.block
  br label %.preheader9.preheader145

.preheader9.preheader145:                         ; preds = %middle.block..preheader9.preheader145_crit_edge, %min.iters.checked..preheader9.preheader145_crit_edge, %.preheader9.preheader..preheader9.preheader145_crit_edge, %vector.memcheck
  br i1 true, label %.preheader9.prol.loopexit.unr-lcssa, label %.preheader9.prol.preheader

.preheader9.prol.preheader:                       ; preds = %.preheader9.preheader145
  %58 = load double, double* %30, align 8
  %59 = load double, double* %scevgep103, align 8
  %60 = fmul double %58, %59
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv2157, i64 0
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  store double %63, double* %61, align 8
  br label %.preheader9.prol.loopexit.unr-lcssa

.preheader9.prol.loopexit.unr-lcssa:              ; preds = %.preheader9.preheader145, %.preheader9.prol.preheader
  br i1 false, label %.preheader9.prol.loopexit.unr-lcssa..preheader10.loopexit_crit_edge, label %.preheader9.preheader145.new

.preheader9.prol.loopexit.unr-lcssa..preheader10.loopexit_crit_edge: ; preds = %.preheader9.prol.loopexit.unr-lcssa
  br label %.preheader10.loopexit

.preheader9.preheader145.new:                     ; preds = %.preheader9.prol.loopexit.unr-lcssa
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9, %.preheader9.preheader145.new
  %indvars.iv1754 = phi i64 [ 0, %.preheader9.preheader145.new ], [ %indvars.iv.next18.1, %.preheader9 ]
  %64 = load double, double* %30, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1754, i64 %indvars.iv2559
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv2157, i64 %indvars.iv1754
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1754, 1
  %71 = load double, double* %30, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next18, i64 %indvars.iv2559
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv2157, i64 %indvars.iv.next18
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv1754, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next18.1, 2000
  br i1 %exitcond20.1, label %.preheader10.loopexit.unr-lcssa, label %.preheader9, !llvm.loop !14

.preheader10.loopexit.unr-lcssa:                  ; preds = %.preheader9
  br label %.preheader10.loopexit

.preheader10.loopexit:                            ; preds = %.preheader9.prol.loopexit.unr-lcssa..preheader10.loopexit_crit_edge, %.preheader10.loopexit.unr-lcssa
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %middle.block
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2157, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond24, label %.preheader11, label %.preheader9.preheader

.preheader11:                                     ; preds = %.preheader10
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2559, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next26, 2000
  br i1 %exitcond95, label %.preheader.preheader.preheader, label %.preheader9.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader8, %.preheader.preheader.preheader
  %indvars.iv1551 = phi i64 [ 0, %.preheader.preheader.preheader ], [ %indvars.iv.next16, %.preheader8 ]
  %scevgep122 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 0
  %scevgep122123 = bitcast double* %scevgep122 to i8*
  %scevgep124 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 2000
  %scevgep124125 = bitcast double* %scevgep124 to i8*
  %78 = mul nuw nsw i64 %indvars.iv1551, 16000
  %scevgep126 = getelementptr i8, i8* %16, i64 %78
  %79 = add i64 16000, %78
  %scevgep127 = getelementptr i8, i8* %16, i64 %79
  br i1 false, label %.preheader.preheader..preheader.preheader144_crit_edge, label %min.iters.checked117

.preheader.preheader..preheader.preheader144_crit_edge: ; preds = %.preheader.preheader
  br label %.preheader.preheader144

min.iters.checked117:                             ; preds = %.preheader.preheader
  br i1 false, label %min.iters.checked117..preheader.preheader144_crit_edge, label %vector.memcheck132

min.iters.checked117..preheader.preheader144_crit_edge: ; preds = %min.iters.checked117
  br label %.preheader.preheader144

vector.memcheck132:                               ; preds = %min.iters.checked117
  %bound0128 = icmp ult i8* %scevgep122123, %scevgep127
  %bound1129 = icmp ult i8* %scevgep126, %scevgep124125
  %memcheck.conflict131 = and i1 %bound0128, %bound1129
  br i1 %memcheck.conflict131, label %.preheader.preheader144, label %vector.body113.preheader

vector.body113.preheader:                         ; preds = %vector.memcheck132
  br label %vector.body113

vector.body113:                                   ; preds = %vector.body113.preheader, %vector.body113
  %index134 = phi i64 [ %index.next135, %vector.body113 ], [ 0, %vector.body113.preheader ]
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %index134
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load142 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !15
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  %wide.load143 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !15
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %index134
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load142, <2 x i64>* %85, align 8, !alias.scope !18, !noalias !15
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  store <2 x i64> %wide.load143, <2 x i64>* %87, align 8, !alias.scope !18, !noalias !15
  %index.next135 = add i64 %index134, 4
  %88 = icmp eq i64 %index.next135, 2000
  br i1 %88, label %middle.block114, label %vector.body113, !llvm.loop !20

middle.block114:                                  ; preds = %vector.body113
  br i1 true, label %.preheader8, label %middle.block114..preheader.preheader144_crit_edge

middle.block114..preheader.preheader144_crit_edge: ; preds = %middle.block114
  br label %.preheader.preheader144

.preheader.preheader144:                          ; preds = %middle.block114..preheader.preheader144_crit_edge, %min.iters.checked117..preheader.preheader144_crit_edge, %.preheader.preheader..preheader.preheader144_crit_edge, %vector.memcheck132
  br i1 true, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader144
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol, %.preheader.prol.preheader
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv50.prol
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv50.prol
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol, !llvm.loop !21

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader144, %.preheader.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader.prol.loopexit..preheader8.loopexit_crit_edge, label %.preheader.preheader144.new

.preheader.prol.loopexit..preheader8.loopexit_crit_edge: ; preds = %.preheader.prol.loopexit
  br label %.preheader8.loopexit

.preheader.preheader144.new:                      ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader144.new
  %indvars.iv50 = phi i64 [ 0, %.preheader.preheader144.new ], [ %indvars.iv.next.3, %.preheader ]
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv50
  %95 = bitcast double* %94 to i64*
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv50
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv50, 1
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv50, 2
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next.1
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next.1
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv50, 3
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next.2
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next.2
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv50, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %.preheader8.loopexit.unr-lcssa, label %.preheader, !llvm.loop !22

.preheader8.loopexit.unr-lcssa:                   ; preds = %.preheader
  br label %.preheader8.loopexit

.preheader8.loopexit:                             ; preds = %.preheader.prol.loopexit..preheader8.loopexit_crit_edge, %.preheader8.loopexit.unr-lcssa
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit, %middle.block114
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1551, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond94, label %.preheader8._crit_edge.loopexit, label %.preheader.preheader

.preheader8._crit_edge.loopexit:                  ; preds = %.preheader8
  br label %.preheader8._crit_edge

.preheader8._crit_edge:                           ; preds = %.preheader8._crit_edge.loopexit, %._crit_edge.thread
  %114 = phi i8* [ undef, %._crit_edge.thread ], [ %16, %.preheader8._crit_edge.loopexit ]
  tail call void @free(i8* %114) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader4.preheader.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.preheader4.preheader.preheader:                  ; preds = %2
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.preheader.preheader, %.preheader3._crit_edge
  %indvars.iv = phi i2 [ 0, %.preheader4.preheader.preheader ], [ %indvars.iv.next38, %.preheader3._crit_edge ]
  %indvars.iv1827 = phi i64 [ %indvars.iv.next19, %.preheader3._crit_edge ], [ 0, %.preheader4.preheader.preheader ]
  %3 = zext i2 %indvars.iv to i64
  %4 = add nsw i64 %indvars.iv1827, -1
  %exitcond1222 = icmp eq i64 %indvars.iv1827, 0
  br i1 %exitcond1222, label %.preheader4.preheader..preheader3._crit_edge_crit_edge, label %.preheader.preheader.preheader

.preheader4.preheader..preheader3._crit_edge_crit_edge: ; preds = %.preheader4.preheader
  %.phi.trans.insert39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 0
  %.pre40 = load double, double* %.phi.trans.insert39, align 8
  %.pre41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 0
  br label %.preheader3._crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader4.preheader
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 0
  br label %.preheader.preheader

.lr.ph26:                                         ; preds = %.preheader4
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1827
  %.pre31 = load double, double* %5, align 8
  %xtraiter33 = and i64 %indvars.iv1827, 3
  %lcmp.mod34 = icmp eq i64 %xtraiter33, 0
  br i1 %lcmp.mod34, label %.preheader3.prol.loopexit, label %.preheader3.prol.preheader

.preheader3.prol.preheader:                       ; preds = %.lr.ph26
  br label %.preheader3.prol

.preheader3.prol:                                 ; preds = %.preheader3.prol, %.preheader3.prol.preheader
  %6 = phi double [ %.pre31, %.preheader3.prol.preheader ], [ %10, %.preheader3.prol ]
  %indvars.iv1325.prol = phi i64 [ 0, %.preheader3.prol.preheader ], [ %indvars.iv.next14.prol, %.preheader3.prol ]
  %prol.iter = phi i64 [ %xtraiter33, %.preheader3.prol.preheader ], [ %prol.iter.sub, %.preheader3.prol ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1325.prol
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fsub double %6, %9
  store double %10, double* %5, align 8
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv1325.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader3.prol.loopexit.unr-lcssa, label %.preheader3.prol, !llvm.loop !23

.preheader3.prol.loopexit.unr-lcssa:              ; preds = %.preheader3.prol
  br label %.preheader3.prol.loopexit

.preheader3.prol.loopexit:                        ; preds = %.lr.ph26, %.preheader3.prol.loopexit.unr-lcssa
  %.unr35 = phi double [ %.pre31, %.lr.ph26 ], [ %10, %.preheader3.prol.loopexit.unr-lcssa ]
  %indvars.iv1325.unr = phi i64 [ 0, %.lr.ph26 ], [ %3, %.preheader3.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %4, 3
  br i1 %11, label %.preheader3._crit_edge.loopexit, label %.lr.ph26.new

.lr.ph26.new:                                     ; preds = %.preheader3.prol.loopexit
  br label %.preheader3

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader4
  %indvars.iv723 = phi i64 [ %indvars.iv.next8, %.preheader4 ], [ 0, %.preheader.preheader.preheader ]
  %exitcond20 = icmp eq i64 %indvars.iv723, 0
  br i1 %exitcond20, label %.preheader.preheader..preheader4_crit_edge, label %.lr.ph

.preheader.preheader..preheader4_crit_edge:       ; preds = %.preheader.preheader
  %.pre30 = load double, double* %.phi.trans.insert, align 8
  br label %.preheader4

.lr.ph:                                           ; preds = %.preheader.preheader
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv723
  %.pre = load double, double* %12, align 8
  %xtraiter = and i64 %indvars.iv723, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.lr.ph
  %13 = load double, double* %.phi.trans.insert, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 0
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %.pre, %16
  store double %17, double* %12, align 8
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph, %.preheader.prol.preheader
  %.lcssa.unr.ph = phi double [ %17, %.preheader.prol.preheader ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %17, %.preheader.prol.preheader ], [ %.pre, %.lr.ph ]
  %indvars.iv21.unr.ph = phi i64 [ 1, %.preheader.prol.preheader ], [ 0, %.lr.ph ]
  %18 = icmp eq i64 %indvars.iv723, 1
  br i1 %18, label %.preheader4.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader.prol.loopexit.unr-lcssa
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.lr.ph.new
  %19 = phi double [ %.unr.ph, %.lr.ph.new ], [ %31, %.preheader ]
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %.preheader ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv21
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv21
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %12, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %12, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv723
  br i1 %exitcond.1, label %.preheader4.loopexit.unr-lcssa, label %.preheader

.preheader4.loopexit.unr-lcssa:                   ; preds = %.preheader
  br label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %.preheader.prol.loopexit.unr-lcssa, %.preheader4.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.preheader.prol.loopexit.unr-lcssa ], [ %31, %.preheader4.loopexit.unr-lcssa ]
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader.preheader..preheader4_crit_edge
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader.preheader..preheader4_crit_edge ], [ %12, %.preheader4.loopexit ]
  %32 = phi double [ %.pre30, %.preheader.preheader..preheader4_crit_edge ], [ %.lcssa, %.preheader4.loopexit ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv723
  %34 = load double, double* %33, align 8
  %35 = fdiv double %32, %34
  store double %35, double* %.pre-phi, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv723, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next8, %indvars.iv1827
  br i1 %exitcond12, label %.lr.ph26, label %.preheader.preheader

.preheader3:                                      ; preds = %.preheader3, %.lr.ph26.new
  %36 = phi double [ %.unr35, %.lr.ph26.new ], [ %52, %.preheader3 ]
  %indvars.iv1325 = phi i64 [ %indvars.iv1325.unr, %.lr.ph26.new ], [ %indvars.iv.next14.3, %.preheader3 ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1325
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %38
  %40 = fsub double %36, %39
  store double %40, double* %5, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1325, 1
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %42
  %44 = fsub double %40, %43
  store double %44, double* %5, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1325, 2
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14.1
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %46
  %48 = fsub double %44, %47
  store double %48, double* %5, align 8
  %indvars.iv.next14.2 = add nsw i64 %indvars.iv1325, 3
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14.2
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %50
  %52 = fsub double %48, %51
  store double %52, double* %5, align 8
  %indvars.iv.next14.3 = add nuw nsw i64 %indvars.iv1325, 4
  %exitcond17.3 = icmp eq i64 %indvars.iv.next14.3, %indvars.iv1827
  br i1 %exitcond17.3, label %.preheader3._crit_edge.loopexit.unr-lcssa, label %.preheader3

.preheader3._crit_edge.loopexit.unr-lcssa:        ; preds = %.preheader3
  br label %.preheader3._crit_edge.loopexit

.preheader3._crit_edge.loopexit:                  ; preds = %.preheader3.prol.loopexit, %.preheader3._crit_edge.loopexit.unr-lcssa
  %53 = phi double [ %.unr35, %.preheader3.prol.loopexit ], [ %52, %.preheader3._crit_edge.loopexit.unr-lcssa ]
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader4.preheader..preheader3._crit_edge_crit_edge, %.preheader3._crit_edge.loopexit
  %.pre-phi42 = phi double* [ %.pre41, %.preheader4.preheader..preheader3._crit_edge_crit_edge ], [ %5, %.preheader3._crit_edge.loopexit ]
  %54 = phi double [ %.pre40, %.preheader4.preheader..preheader3._crit_edge_crit_edge ], [ %53, %.preheader3._crit_edge.loopexit ]
  %55 = tail call double @sqrt(double %54) #3
  store double %55, double* %.pre-phi42, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1827, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next19, 2000
  %indvars.iv.next38 = add i2 %indvars.iv, 1
  br i1 %exitcond28, label %._crit_edge.loopexit, label %.preheader4.preheader

._crit_edge.loopexit:                             ; preds = %.preheader3._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.preheader.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %18
  %indvars.iv410 = phi i64 [ %indvars.iv.next5, %18 ], [ 1, %.preheader.preheader.preheader ]
  %indvars.iv69 = phi i64 [ %indvars.iv.next7, %18 ], [ 0, %.preheader.preheader.preheader ]
  %7 = mul nsw i64 %indvars.iv69, 2000
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader, %.preheader.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %8 = add nsw i64 %indvars.iv8, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.preheader

; <label>:12:                                     ; preds = %.preheader._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %.preheader

.preheader:                                       ; preds = %.preheader._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv8
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv410
  br i1 %exitcond, label %18, label %.preheader._crit_edge

; <label>:18:                                     ; preds = %.preheader
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next7, 2000
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  br i1 %exitcond11, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %18
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
