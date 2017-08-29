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
  br i1 true, label %.preheader14.preheader.lr.ph, label %._crit_edge88.thread

._crit_edge88.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge

.preheader14.preheader.lr.ph:                     ; preds = %2
  br label %.preheader14.preheader

.preheader14.preheader:                           ; preds = %.preheader13._crit_edge, %.preheader14.preheader.lr.ph
  %indvars.iv4587 = phi i64 [ 1, %.preheader14.preheader.lr.ph ], [ %indvars.iv.next46, %.preheader13._crit_edge ]
  %indvars.iv4786 = phi i64 [ 0, %.preheader14.preheader.lr.ph ], [ %indvars.iv.next48, %.preheader13._crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv4786, 2001
  %5 = add nuw nsw i64 %4, 1
  %scevgep98 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  br label %.preheader14

.preheader13.preheader:                           ; preds = %.preheader14
  %6 = mul nsw i64 %indvars.iv4786, -8
  %scevgep9899 = bitcast double* %scevgep98 to i8*
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
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9899, i8 0, i64 %7, i32 8, i1 false)
  br label %.preheader13._crit_edge

.preheader13._crit_edge:                          ; preds = %.preheader13.preheader, %.preheader13._crit_edge.loopexit
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4786, i64 %indvars.iv4786
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv4786, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next48, 2000
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4587, 1
  br i1 %exitcond100, label %._crit_edge88, label %.preheader14.preheader

._crit_edge88:                                    ; preds = %.preheader13._crit_edge
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %.preheader12._crit_edge.prol.loopexit, label %.preheader12._crit_edge.prol.preheader

.preheader12._crit_edge.prol.preheader:           ; preds = %._crit_edge88
  br label %.preheader12._crit_edge.prol

.preheader12._crit_edge.prol:                     ; preds = %.preheader12._crit_edge.prol, %.preheader12._crit_edge.prol.preheader
  %indvars.iv3179.prol = phi i64 [ 0, %.preheader12._crit_edge.prol.preheader ], [ %indvars.iv.next32.prol, %.preheader12._crit_edge.prol ]
  %prol.iter151 = phi i64 [ 0, %.preheader12._crit_edge.prol.preheader ], [ %prol.iter151.sub, %.preheader12._crit_edge.prol ]
  %17 = mul nuw nsw i64 %indvars.iv3179.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.prol = add nuw nsw i64 %indvars.iv3179.prol, 1
  %prol.iter151.sub = add nsw i64 %prol.iter151, -1
  %prol.iter151.cmp = icmp eq i64 %prol.iter151.sub, 0
  br i1 %prol.iter151.cmp, label %.preheader12._crit_edge.prol.loopexit.unr-lcssa, label %.preheader12._crit_edge.prol, !llvm.loop !1

.preheader12._crit_edge.prol.loopexit.unr-lcssa:  ; preds = %.preheader12._crit_edge.prol
  br label %.preheader12._crit_edge.prol.loopexit

.preheader12._crit_edge.prol.loopexit:            ; preds = %._crit_edge88, %.preheader12._crit_edge.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader10.preheader.preheader, label %._crit_edge88.new

._crit_edge88.new:                                ; preds = %.preheader12._crit_edge.prol.loopexit
  br label %.preheader12._crit_edge

.preheader10.preheader.preheader.unr-lcssa:       ; preds = %.preheader12._crit_edge
  br label %.preheader10.preheader.preheader

.preheader10.preheader.preheader:                 ; preds = %.preheader12._crit_edge.prol.loopexit, %.preheader10.preheader.preheader.unr-lcssa
  %18 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader9.preheader.preheader

.preheader12._crit_edge:                          ; preds = %.preheader12._crit_edge, %._crit_edge88.new
  %indvars.iv3179 = phi i64 [ 0, %._crit_edge88.new ], [ %indvars.iv.next32.7, %.preheader12._crit_edge ]
  %19 = mul nuw nsw i64 %indvars.iv3179, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %20 = mul i64 %indvars.iv3179, 16000
  %21 = add i64 %20, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %22 = mul i64 %indvars.iv3179, 16000
  %23 = add i64 %22, 32000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv3179, 16000
  %25 = add i64 %24, 48000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv3179, 16000
  %27 = add i64 %26, 64000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv3179, 16000
  %29 = add i64 %28, 80000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv3179, 16000
  %31 = add i64 %30, 96000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv3179, 16000
  %33 = add i64 %32, 112000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.7 = add nsw i64 %indvars.iv3179, 8
  %exitcond97.7 = icmp eq i64 %indvars.iv.next32.7, 2000
  br i1 %exitcond97.7, label %.preheader10.preheader.preheader.unr-lcssa, label %.preheader12._crit_edge

.preheader9.preheader.preheader:                  ; preds = %.preheader10._crit_edge, %.preheader10.preheader.preheader
  %indvars.iv2559 = phi i64 [ 0, %.preheader10.preheader.preheader ], [ %indvars.iv.next26, %.preheader10._crit_edge ]
  %scevgep104 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv2559
  %scevgep104105 = bitcast double* %scevgep104 to i8*
  %34 = add nsw i64 %indvars.iv2559, -1999
  %scevgep106 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %34
  %scevgep106107 = bitcast double* %scevgep106 to i8*
  br label %.preheader9.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader10._crit_edge
  br label %.preheader.preheader

.preheader9.preheader:                            ; preds = %.preheader10, %.preheader9.preheader.preheader
  %indvars.iv2157 = phi i64 [ 0, %.preheader9.preheader.preheader ], [ %indvars.iv.next22, %.preheader10 ]
  %35 = mul nuw nsw i64 %indvars.iv2157, 16000
  %scevgep102 = getelementptr i8, i8* %16, i64 %35
  %36 = add i64 16000, %35
  %scevgep103 = getelementptr i8, i8* %16, i64 %36
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2157, i64 %indvars.iv2559
  br i1 false, label %.preheader9.preheader146, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader9.preheader
  br i1 false, label %.preheader9.preheader146, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep102, %scevgep106107
  %bound1 = icmp ult i8* %scevgep104105, %scevgep103
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %37 to i8*
  %bc108 = bitcast double* %37 to i8*
  %bound0109 = icmp ult i8* %scevgep102, %bc108
  %bound1110 = icmp ult i8* %bc, %scevgep103
  %found.conflict111 = and i1 %bound0109, %bound1110
  %conflict.rdx = or i1 %found.conflict, %found.conflict111
  br i1 %conflict.rdx, label %.preheader9.preheader146, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %38 = or i64 %index, 1
  %39 = or i64 %index, 2
  %40 = or i64 %index, 3
  %41 = load double, double* %37, align 8, !alias.scope !3
  %42 = insertelement <2 x double> undef, double %41, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = insertelement <2 x double> undef, double %41, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv2559
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %38, i64 %indvars.iv2559
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %39, i64 %indvars.iv2559
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %40, i64 %indvars.iv2559
  %50 = load double, double* %46, align 8, !alias.scope !6
  %51 = load double, double* %47, align 8, !alias.scope !6
  %52 = load double, double* %48, align 8, !alias.scope !6
  %53 = load double, double* %49, align 8, !alias.scope !6
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = insertelement <2 x double> undef, double %52, i32 0
  %57 = insertelement <2 x double> %56, double %53, i32 1
  %58 = fmul <2 x double> %43, %55
  %59 = fmul <2 x double> %45, %57
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv2157, i64 %index
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !8, !noalias !10
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !8, !noalias !10
  %64 = fadd <2 x double> %wide.load, %58
  %65 = fadd <2 x double> %wide.load113, %59
  %66 = bitcast double* %60 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8, !alias.scope !8, !noalias !10
  %67 = bitcast double* %62 to <2 x double>*
  store <2 x double> %65, <2 x double>* %67, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %68 = icmp eq i64 %index.next, 2000
  br i1 %68, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %.preheader10, label %.preheader9.preheader146

.preheader9.preheader146:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader9.preheader
  %indvars.iv1754.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader9.preheader ], [ 2000, %middle.block ]
  br i1 true, label %.preheader9.prol.loopexit.unr-lcssa, label %.preheader9.prol.preheader

.preheader9.prol.preheader:                       ; preds = %.preheader9.preheader146
  br label %.preheader9.prol

.preheader9.prol:                                 ; preds = %.preheader9.prol.preheader
  %69 = load double, double* %37, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1754.ph, i64 %indvars.iv2559
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv2157, i64 %indvars.iv1754.ph
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %72
  store double %75, double* %73, align 8
  %indvars.iv.next18.prol = add nuw nsw i64 %indvars.iv1754.ph, 1
  br label %.preheader9.prol.loopexit.unr-lcssa

.preheader9.prol.loopexit.unr-lcssa:              ; preds = %.preheader9.preheader146, %.preheader9.prol
  %indvars.iv1754.unr.ph = phi i64 [ %indvars.iv.next18.prol, %.preheader9.prol ], [ %indvars.iv1754.ph, %.preheader9.preheader146 ]
  br label %.preheader9.prol.loopexit

.preheader9.prol.loopexit:                        ; preds = %.preheader9.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader10.loopexit, label %.preheader9.preheader146.new

.preheader9.preheader146.new:                     ; preds = %.preheader9.prol.loopexit
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9, %.preheader9.preheader146.new
  %indvars.iv1754 = phi i64 [ %indvars.iv1754.unr.ph, %.preheader9.preheader146.new ], [ %indvars.iv.next18.1, %.preheader9 ]
  %76 = load double, double* %37, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1754, i64 %indvars.iv2559
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv2157, i64 %indvars.iv1754
  %81 = load double, double* %80, align 8
  %82 = fadd double %81, %79
  store double %82, double* %80, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1754, 1
  %83 = load double, double* %37, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next18, i64 %indvars.iv2559
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv2157, i64 %indvars.iv.next18
  %88 = load double, double* %87, align 8
  %89 = fadd double %88, %86
  store double %89, double* %87, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv1754, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next18.1, 2000
  br i1 %exitcond20.1, label %.preheader10.loopexit.unr-lcssa, label %.preheader9, !llvm.loop !14

.preheader10.loopexit.unr-lcssa:                  ; preds = %.preheader9
  br label %.preheader10.loopexit

.preheader10.loopexit:                            ; preds = %.preheader9.prol.loopexit, %.preheader10.loopexit.unr-lcssa
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %middle.block
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2157, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond24, label %.preheader10._crit_edge, label %.preheader9.preheader

.preheader10._crit_edge:                          ; preds = %.preheader10
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2559, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next26, 2000
  br i1 %exitcond96, label %.preheader.preheader.preheader, label %.preheader9.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv1551 = phi i64 [ 0, %.preheader.preheader.preheader ], [ %indvars.iv.next16, %.preheader._crit_edge ]
  %scevgep123 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 0
  %scevgep123124 = bitcast double* %scevgep123 to i8*
  %scevgep125 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 2000
  %scevgep125126 = bitcast double* %scevgep125 to i8*
  %90 = mul nuw nsw i64 %indvars.iv1551, 16000
  %scevgep127 = getelementptr i8, i8* %16, i64 %90
  %91 = add i64 16000, %90
  %scevgep128 = getelementptr i8, i8* %16, i64 %91
  br i1 false, label %.preheader.preheader145, label %min.iters.checked118

min.iters.checked118:                             ; preds = %.preheader.preheader
  br i1 false, label %.preheader.preheader145, label %vector.memcheck133

vector.memcheck133:                               ; preds = %min.iters.checked118
  %bound0129 = icmp ult i8* %scevgep123124, %scevgep128
  %bound1130 = icmp ult i8* %scevgep127, %scevgep125126
  %memcheck.conflict132 = and i1 %bound0129, %bound1130
  br i1 %memcheck.conflict132, label %.preheader.preheader145, label %vector.body114.preheader

vector.body114.preheader:                         ; preds = %vector.memcheck133
  br label %vector.body114

vector.body114:                                   ; preds = %vector.body114.preheader, %vector.body114
  %index135 = phi i64 [ %index.next136, %vector.body114 ], [ 0, %vector.body114.preheader ]
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %index135
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load143 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !15
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load144 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !15
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %index135
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load143, <2 x i64>* %97, align 8, !alias.scope !18, !noalias !15
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load144, <2 x i64>* %99, align 8, !alias.scope !18, !noalias !15
  %index.next136 = add i64 %index135, 4
  %100 = icmp eq i64 %index.next136, 2000
  br i1 %100, label %middle.block115, label %vector.body114, !llvm.loop !20

middle.block115:                                  ; preds = %vector.body114
  br i1 true, label %.preheader._crit_edge, label %.preheader.preheader145

.preheader.preheader145:                          ; preds = %middle.block115, %vector.memcheck133, %min.iters.checked118, %.preheader.preheader
  %indvars.iv50.ph = phi i64 [ 0, %vector.memcheck133 ], [ 0, %min.iters.checked118 ], [ 0, %.preheader.preheader ], [ 2000, %middle.block115 ]
  %101 = sub nsw i64 1999, %indvars.iv50.ph
  br i1 true, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader145
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol, %.preheader.prol.preheader
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.prol ], [ %indvars.iv50.ph, %.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv50.prol
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv50.prol
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol, !llvm.loop !21

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader145, %.preheader.prol.loopexit.unr-lcssa
  %107 = icmp ult i64 %101, 3
  br i1 %107, label %.preheader._crit_edge.loopexit, label %.preheader.preheader145.new

.preheader.preheader145.new:                      ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader145.new
  %indvars.iv50 = phi i64 [ %indvars.iv50.ph, %.preheader.preheader145.new ], [ %indvars.iv.next.3, %.preheader ]
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv50
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv50
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv50, 1
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv50, 2
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next.1
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next.1
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv50, 3
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next.2
  %124 = bitcast double* %123 to i64*
  %125 = load i64, i64* %124, align 8
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next.2
  %127 = bitcast double* %126 to i64*
  store i64 %125, i64* %127, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv50, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %.preheader._crit_edge.loopexit.unr-lcssa, label %.preheader, !llvm.loop !22

.preheader._crit_edge.loopexit.unr-lcssa:         ; preds = %.preheader
  br label %.preheader._crit_edge.loopexit

.preheader._crit_edge.loopexit:                   ; preds = %.preheader.prol.loopexit, %.preheader._crit_edge.loopexit.unr-lcssa
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %middle.block115
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1551, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond95, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge88.thread
  %128 = phi i8* [ %3, %._crit_edge88.thread ], [ %16, %._crit_edge.loopexit ]
  tail call void @free(i8* %128) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader4.preheader.preheader, label %._crit_edge

.preheader4.preheader.preheader:                  ; preds = %2
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.preheader.preheader, %.preheader3._crit_edge
  %indvars.iv = phi i2 [ 0, %.preheader4.preheader.preheader ], [ %indvars.iv.next38, %.preheader3._crit_edge ]
  %indvars.iv1827 = phi i64 [ %indvars.iv.next19, %.preheader3._crit_edge ], [ 0, %.preheader4.preheader.preheader ]
  %3 = zext i2 %indvars.iv to i64
  %4 = add nsw i64 %indvars.iv1827, -1
  %exitcond1222 = icmp eq i64 %indvars.iv1827, 0
  br i1 %exitcond1222, label %.preheader3._crit_edge, label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader4.preheader
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 0
  %.pre32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 0
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 0
  br label %.preheader.preheader

.lr.ph26:                                         ; preds = %.preheader4
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1827
  %.pre31 = load double, double* %6, align 8
  %xtraiter33 = and i64 %indvars.iv1827, 3
  %lcmp.mod34 = icmp eq i64 %xtraiter33, 0
  br i1 %lcmp.mod34, label %.preheader3.prol.loopexit, label %.preheader3.prol.preheader

.preheader3.prol.preheader:                       ; preds = %.lr.ph26
  br label %.preheader3.prol

.preheader3.prol:                                 ; preds = %.preheader3.prol, %.preheader3.prol.preheader
  %7 = phi double [ %.pre31, %.preheader3.prol.preheader ], [ %11, %.preheader3.prol ]
  %indvars.iv1325.prol = phi i64 [ 0, %.preheader3.prol.preheader ], [ %indvars.iv.next14.prol, %.preheader3.prol ]
  %prol.iter = phi i64 [ %xtraiter33, %.preheader3.prol.preheader ], [ %prol.iter.sub, %.preheader3.prol ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1325.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %6, align 8
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv1325.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader3.prol.loopexit.unr-lcssa, label %.preheader3.prol, !llvm.loop !23

.preheader3.prol.loopexit.unr-lcssa:              ; preds = %.preheader3.prol
  br label %.preheader3.prol.loopexit

.preheader3.prol.loopexit:                        ; preds = %.lr.ph26, %.preheader3.prol.loopexit.unr-lcssa
  %.unr35 = phi double [ %.pre31, %.lr.ph26 ], [ %11, %.preheader3.prol.loopexit.unr-lcssa ]
  %indvars.iv1325.unr = phi i64 [ 0, %.lr.ph26 ], [ %3, %.preheader3.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %4, 3
  br i1 %12, label %.preheader3._crit_edge.loopexit, label %.lr.ph26.new

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
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv723
  %.pre = load double, double* %13, align 8
  %xtraiter = and i64 %indvars.iv723, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.lr.ph
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader
  %14 = load double, double* %5, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 0
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %13, align 8
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph, %.preheader.prol
  %.lcssa.unr.ph = phi double [ %18, %.preheader.prol ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %18, %.preheader.prol ], [ %.pre, %.lr.ph ]
  %indvars.iv21.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.lr.ph ]
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %indvars.iv723, 1
  br i1 %19, label %.preheader4.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.lr.ph.new
  %20 = phi double [ %.unr.ph, %.lr.ph.new ], [ %32, %.preheader ]
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %.preheader ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv21
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv21
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv723
  br i1 %exitcond.1, label %.preheader4.loopexit.unr-lcssa, label %.preheader

.preheader4.loopexit.unr-lcssa:                   ; preds = %.preheader
  br label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %.preheader.prol.loopexit, %.preheader4.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.preheader.prol.loopexit ], [ %32, %.preheader4.loopexit.unr-lcssa ]
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader.preheader..preheader4_crit_edge
  %.pre-phi = phi double* [ %.pre32, %.preheader.preheader..preheader4_crit_edge ], [ %13, %.preheader4.loopexit ]
  %33 = phi double [ %.pre30, %.preheader.preheader..preheader4_crit_edge ], [ %.lcssa, %.preheader4.loopexit ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv723
  %35 = load double, double* %34, align 8
  %36 = fdiv double %33, %35
  store double %36, double* %.pre-phi, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv723, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next8, %indvars.iv1827
  br i1 %exitcond12, label %.lr.ph26, label %.preheader.preheader

.preheader3:                                      ; preds = %.preheader3, %.lr.ph26.new
  %37 = phi double [ %.unr35, %.lr.ph26.new ], [ %53, %.preheader3 ]
  %indvars.iv1325 = phi i64 [ %indvars.iv1325.unr, %.lr.ph26.new ], [ %indvars.iv.next14.3, %.preheader3 ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1325
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fsub double %37, %40
  store double %41, double* %6, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1325, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %6, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1325, 2
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14.1
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %6, align 8
  %indvars.iv.next14.2 = add nsw i64 %indvars.iv1325, 3
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %6, align 8
  %indvars.iv.next14.3 = add nuw nsw i64 %indvars.iv1325, 4
  %exitcond17.3 = icmp eq i64 %indvars.iv.next14.3, %indvars.iv1827
  br i1 %exitcond17.3, label %.preheader3._crit_edge.loopexit.unr-lcssa, label %.preheader3

.preheader3._crit_edge.loopexit.unr-lcssa:        ; preds = %.preheader3
  br label %.preheader3._crit_edge.loopexit

.preheader3._crit_edge.loopexit:                  ; preds = %.preheader3.prol.loopexit, %.preheader3._crit_edge.loopexit.unr-lcssa
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader3._crit_edge.loopexit, %.preheader4.preheader
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1827
  %55 = load double, double* %54, align 8
  %56 = tail call double @sqrt(double %55) #3
  store double %56, double* %54, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1827, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next19, 2000
  %indvars.iv.next38 = add i2 %indvars.iv, 1
  br i1 %exitcond28, label %._crit_edge.loopexit, label %.preheader4.preheader

._crit_edge.loopexit:                             ; preds = %.preheader3._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
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
  br i1 true, label %.preheader.preheader.preheader, label %._crit_edge

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

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
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
