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
  br i1 true, label %.preheader6.preheader.lr.ph, label %._crit_edge86.thread

._crit_edge86.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %.preheader1._crit_edge

.preheader6.preheader.lr.ph:                      ; preds = %2
  br label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %._crit_edge, %.preheader6.preheader.lr.ph
  %indvars.iv = phi i64 [ 1, %.preheader6.preheader.lr.ph ], [ %indvars.iv.next98, %._crit_edge ]
  %indvars.iv4582 = phi i64 [ 0, %.preheader6.preheader.lr.ph ], [ %indvars.iv.next46, %._crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv4582, 2001
  %5 = add nuw nsw i64 %4, 1
  %scevgep96 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %6 = mul nsw i64 %indvars.iv4582, -8
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6, %.preheader6.preheader
  %indvars.iv3079 = phi i64 [ 0, %.preheader6.preheader ], [ %indvars.iv.next31, %.preheader6 ]
  %7 = sub nsw i64 0, %indvars.iv3079
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4582, i64 %indvars.iv3079
  store double %12, double* %13, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3079, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next31, %indvars.iv
  br i1 %exitcond35, label %14, label %.preheader6

; <label>:14:                                     ; preds = %.preheader6
  %scevgep9697 = bitcast double* %scevgep96 to i8*
  %15 = add nsw i64 15992, %6
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4582, 1
  %16 = icmp slt i64 %indvars.iv, 2000
  br i1 %16, label %._crit_edge.loopexit, label %._crit_edge

._crit_edge.loopexit:                             ; preds = %14
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9697, i8 0, i64 %15, i32 8, i1 false)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %._crit_edge.loopexit
  %17 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv4582, i64 %indvars.iv4582
  store double 1.000000e+00, double* %17, align 8
  %exitcond99 = icmp eq i64 %indvars.iv.next46, 2000
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond99, label %._crit_edge86, label %.preheader6.preheader

._crit_edge86:                                    ; preds = %._crit_edge
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br i1 true, label %.preheader5._crit_edge.prol.loopexit, label %.preheader5._crit_edge.prol.preheader

.preheader5._crit_edge.prol.preheader:            ; preds = %._crit_edge86
  br label %.preheader5._crit_edge.prol

.preheader5._crit_edge.prol:                      ; preds = %.preheader5._crit_edge.prol, %.preheader5._crit_edge.prol.preheader
  %indvars.iv2877.prol = phi i64 [ 0, %.preheader5._crit_edge.prol.preheader ], [ %indvars.iv.next29.prol, %.preheader5._crit_edge.prol ]
  %prol.iter152 = phi i64 [ 0, %.preheader5._crit_edge.prol.preheader ], [ %prol.iter152.sub, %.preheader5._crit_edge.prol ]
  %20 = mul nuw nsw i64 %indvars.iv2877.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next29.prol = add nuw nsw i64 %indvars.iv2877.prol, 1
  %prol.iter152.sub = add nsw i64 %prol.iter152, -1
  %prol.iter152.cmp = icmp eq i64 %prol.iter152.sub, 0
  br i1 %prol.iter152.cmp, label %.preheader5._crit_edge.prol.loopexit.unr-lcssa, label %.preheader5._crit_edge.prol, !llvm.loop !1

.preheader5._crit_edge.prol.loopexit.unr-lcssa:   ; preds = %.preheader5._crit_edge.prol
  br label %.preheader5._crit_edge.prol.loopexit

.preheader5._crit_edge.prol.loopexit:             ; preds = %._crit_edge86, %.preheader5._crit_edge.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader3.preheader.preheader, label %._crit_edge86.new

._crit_edge86.new:                                ; preds = %.preheader5._crit_edge.prol.loopexit
  br label %.preheader5._crit_edge

.preheader3.preheader.preheader.unr-lcssa:        ; preds = %.preheader5._crit_edge
  br label %.preheader3.preheader.preheader

.preheader3.preheader.preheader:                  ; preds = %.preheader5._crit_edge.prol.loopexit, %.preheader3.preheader.preheader.unr-lcssa
  br label %.preheader2.preheader.preheader

.preheader5._crit_edge:                           ; preds = %.preheader5._crit_edge, %._crit_edge86.new
  %indvars.iv2877 = phi i64 [ 0, %._crit_edge86.new ], [ %indvars.iv.next29.7, %.preheader5._crit_edge ]
  %21 = mul nuw nsw i64 %indvars.iv2877, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %22 = mul i64 %indvars.iv2877, 16000
  %23 = add i64 %22, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %24 = mul i64 %indvars.iv2877, 16000
  %25 = add i64 %24, 32000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %26 = mul i64 %indvars.iv2877, 16000
  %27 = add i64 %26, 48000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul i64 %indvars.iv2877, 16000
  %29 = add i64 %28, 64000
  %scevgep.4 = getelementptr i8, i8* %18, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul i64 %indvars.iv2877, 16000
  %31 = add i64 %30, 80000
  %scevgep.5 = getelementptr i8, i8* %18, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul i64 %indvars.iv2877, 16000
  %33 = add i64 %32, 96000
  %scevgep.6 = getelementptr i8, i8* %18, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %34 = mul i64 %indvars.iv2877, 16000
  %35 = add i64 %34, 112000
  %scevgep.7 = getelementptr i8, i8* %18, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next29.7 = add nsw i64 %indvars.iv2877, 8
  %exitcond94.7 = icmp eq i64 %indvars.iv.next29.7, 2000
  br i1 %exitcond94.7, label %.preheader3.preheader.preheader.unr-lcssa, label %.preheader5._crit_edge

.preheader2.preheader.preheader:                  ; preds = %.preheader4, %.preheader3.preheader.preheader
  %indvars.iv2257 = phi i64 [ 0, %.preheader3.preheader.preheader ], [ %indvars.iv.next23, %.preheader4 ]
  %scevgep105 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv2257
  %scevgep105106 = bitcast double* %scevgep105 to i8*
  %36 = add nsw i64 %indvars.iv2257, -1999
  %scevgep107 = getelementptr [2000 x double], [2000 x double]* %1, i64 2000, i64 %36
  %scevgep107108 = bitcast double* %scevgep107 to i8*
  br label %.preheader2.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader4
  br label %.preheader.preheader

.preheader2.preheader:                            ; preds = %.preheader3, %.preheader2.preheader.preheader
  %indvars.iv1855 = phi i64 [ 0, %.preheader2.preheader.preheader ], [ %indvars.iv.next19, %.preheader3 ]
  %37 = mul nuw nsw i64 %indvars.iv1855, 16000
  %scevgep103 = getelementptr i8, i8* %18, i64 %37
  %38 = add i64 16000, %37
  %scevgep104 = getelementptr i8, i8* %18, i64 %38
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1855, i64 %indvars.iv2257
  br i1 false, label %.preheader2.preheader147, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader2.preheader
  br i1 false, label %.preheader2.preheader147, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep103, %scevgep107108
  %bound1 = icmp ult i8* %scevgep105106, %scevgep104
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %39 to i8*
  %bc109 = bitcast double* %39 to i8*
  %bound0110 = icmp ult i8* %scevgep103, %bc109
  %bound1111 = icmp ult i8* %bc, %scevgep104
  %found.conflict112 = and i1 %bound0110, %bound1111
  %conflict.rdx = or i1 %found.conflict, %found.conflict112
  br i1 %conflict.rdx, label %.preheader2.preheader147, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %40 = load double, double* %39, align 8, !alias.scope !3
  %41 = insertelement <2 x double> undef, double %40, i32 0
  %42 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  %43 = insertelement <2 x double> undef, double %40, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %45 = or i64 %index, 1
  %46 = or i64 %index, 2
  %47 = or i64 %index, 3
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv2257
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %45, i64 %indvars.iv2257
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %46, i64 %indvars.iv2257
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %47, i64 %indvars.iv2257
  %52 = load double, double* %48, align 8, !alias.scope !6
  %53 = load double, double* %49, align 8, !alias.scope !6
  %54 = load double, double* %50, align 8, !alias.scope !6
  %55 = load double, double* %51, align 8, !alias.scope !6
  %56 = insertelement <2 x double> undef, double %52, i32 0
  %57 = insertelement <2 x double> %56, double %53, i32 1
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %55, i32 1
  %60 = fmul <2 x double> %42, %57
  %61 = fmul <2 x double> %44, %59
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1855, i64 %index
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !8, !noalias !10
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !8, !noalias !10
  %66 = fadd <2 x double> %wide.load, %60
  %67 = fadd <2 x double> %wide.load114, %61
  %68 = bitcast double* %62 to <2 x double>*
  store <2 x double> %66, <2 x double>* %68, align 8, !alias.scope !8, !noalias !10
  %69 = bitcast double* %64 to <2 x double>*
  store <2 x double> %67, <2 x double>* %69, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %70 = icmp eq i64 %index.next, 2000
  br i1 %70, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %.preheader3, label %.preheader2.preheader147

.preheader2.preheader147:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader2.preheader
  %indvars.iv1452.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader2.preheader ], [ 2000, %middle.block ]
  br i1 true, label %.preheader2.prol.loopexit.unr-lcssa, label %.preheader2.prol.preheader

.preheader2.prol.preheader:                       ; preds = %.preheader2.preheader147
  br label %.preheader2.prol

.preheader2.prol:                                 ; preds = %.preheader2.prol.preheader
  %71 = load double, double* %39, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1452.ph, i64 %indvars.iv2257
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1855, i64 %indvars.iv1452.ph
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv1452.ph, 1
  br label %.preheader2.prol.loopexit.unr-lcssa

.preheader2.prol.loopexit.unr-lcssa:              ; preds = %.preheader2.preheader147, %.preheader2.prol
  %indvars.iv1452.unr.ph = phi i64 [ %indvars.iv.next15.prol, %.preheader2.prol ], [ %indvars.iv1452.ph, %.preheader2.preheader147 ]
  br label %.preheader2.prol.loopexit

.preheader2.prol.loopexit:                        ; preds = %.preheader2.prol.loopexit.unr-lcssa
  br i1 false, label %.preheader3.loopexit, label %.preheader2.preheader147.new

.preheader2.preheader147.new:                     ; preds = %.preheader2.prol.loopexit
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2, %.preheader2.preheader147.new
  %indvars.iv1452 = phi i64 [ %indvars.iv1452.unr.ph, %.preheader2.preheader147.new ], [ %indvars.iv.next15.1, %.preheader2 ]
  %78 = load double, double* %39, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1452, i64 %indvars.iv2257
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1855, i64 %indvars.iv1452
  %83 = load double, double* %82, align 8
  %84 = fadd double %83, %81
  store double %84, double* %82, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1452, 1
  %85 = load double, double* %39, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next15, i64 %indvars.iv2257
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1855, i64 %indvars.iv.next15
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %88
  store double %91, double* %89, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv1452, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next15.1, 2000
  br i1 %exitcond17.1, label %.preheader3.loopexit.unr-lcssa, label %.preheader2, !llvm.loop !14

.preheader3.loopexit.unr-lcssa:                   ; preds = %.preheader2
  br label %.preheader3.loopexit

.preheader3.loopexit:                             ; preds = %.preheader2.prol.loopexit, %.preheader3.loopexit.unr-lcssa
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1855, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond21, label %.preheader4, label %.preheader2.preheader

.preheader4:                                      ; preds = %.preheader3
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2257, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond93, label %.preheader.preheader.preheader, label %.preheader2.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader1, %.preheader.preheader.preheader
  %indvars.iv1249 = phi i64 [ 0, %.preheader.preheader.preheader ], [ %indvars.iv.next13, %.preheader1 ]
  %scevgep124 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv1249, i64 0
  %scevgep124125 = bitcast double* %scevgep124 to i8*
  %scevgep126 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv1249, i64 2000
  %scevgep126127 = bitcast double* %scevgep126 to i8*
  %92 = mul nuw nsw i64 %indvars.iv1249, 16000
  %scevgep128 = getelementptr i8, i8* %18, i64 %92
  %93 = add i64 16000, %92
  %scevgep129 = getelementptr i8, i8* %18, i64 %93
  br i1 false, label %.preheader.preheader146, label %min.iters.checked119

min.iters.checked119:                             ; preds = %.preheader.preheader
  br i1 false, label %.preheader.preheader146, label %vector.memcheck134

vector.memcheck134:                               ; preds = %min.iters.checked119
  %bound0130 = icmp ult i8* %scevgep124125, %scevgep129
  %bound1131 = icmp ult i8* %scevgep128, %scevgep126127
  %memcheck.conflict133 = and i1 %bound0130, %bound1131
  br i1 %memcheck.conflict133, label %.preheader.preheader146, label %vector.body115.preheader

vector.body115.preheader:                         ; preds = %vector.memcheck134
  br label %vector.body115

vector.body115:                                   ; preds = %vector.body115.preheader, %vector.body115
  %index136 = phi i64 [ %index.next137, %vector.body115 ], [ 0, %vector.body115.preheader ]
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1249, i64 %index136
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load144 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !15
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load145 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !15
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1249, i64 %index136
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load144, <2 x i64>* %99, align 8, !alias.scope !18, !noalias !15
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load145, <2 x i64>* %101, align 8, !alias.scope !18, !noalias !15
  %index.next137 = add i64 %index136, 4
  %102 = icmp eq i64 %index.next137, 2000
  br i1 %102, label %middle.block116, label %vector.body115, !llvm.loop !20

middle.block116:                                  ; preds = %vector.body115
  br i1 true, label %.preheader1, label %.preheader.preheader146

.preheader.preheader146:                          ; preds = %middle.block116, %vector.memcheck134, %min.iters.checked119, %.preheader.preheader
  %indvars.iv48.ph = phi i64 [ 0, %vector.memcheck134 ], [ 0, %min.iters.checked119 ], [ 0, %.preheader.preheader ], [ 2000, %middle.block116 ]
  %103 = sub nsw i64 1999, %indvars.iv48.ph
  br i1 true, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader146
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol, %.preheader.prol.preheader
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.prol ], [ %indvars.iv48.ph, %.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1249, i64 %indvars.iv48.prol
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1249, i64 %indvars.iv48.prol
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol, !llvm.loop !21

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader146, %.preheader.prol.loopexit.unr-lcssa
  %109 = icmp ult i64 %103, 3
  br i1 %109, label %.preheader1.loopexit, label %.preheader.preheader146.new

.preheader.preheader146.new:                      ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader146.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.ph, %.preheader.preheader146.new ], [ %indvars.iv.next.3, %.preheader ]
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1249, i64 %indvars.iv48
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1249, i64 %indvars.iv48
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv48, 1
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1249, i64 %indvars.iv.next
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1249, i64 %indvars.iv.next
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv48, 2
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1249, i64 %indvars.iv.next.1
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1249, i64 %indvars.iv.next.1
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv48, 3
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1249, i64 %indvars.iv.next.2
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1249, i64 %indvars.iv.next.2
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv48, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %.preheader1.loopexit.unr-lcssa, label %.preheader, !llvm.loop !22

.preheader1.loopexit.unr-lcssa:                   ; preds = %.preheader
  br label %.preheader1.loopexit

.preheader1.loopexit:                             ; preds = %.preheader.prol.loopexit, %.preheader1.loopexit.unr-lcssa
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.loopexit, %middle.block116
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1249, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond92, label %.preheader1._crit_edge.loopexit, label %.preheader.preheader

.preheader1._crit_edge.loopexit:                  ; preds = %.preheader1
  br label %.preheader1._crit_edge

.preheader1._crit_edge:                           ; preds = %.preheader1._crit_edge.loopexit, %._crit_edge86.thread
  %130 = phi i8* [ %3, %._crit_edge86.thread ], [ %18, %.preheader1._crit_edge.loopexit ]
  tail call void @free(i8* %130) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader2.preheader.preheader, label %._crit_edge

.preheader2.preheader.preheader:                  ; preds = %2
  br label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %.preheader2.preheader.preheader, %.preheader1._crit_edge
  %indvars.iv = phi i2 [ 0, %.preheader2.preheader.preheader ], [ %indvars.iv.next43, %.preheader1._crit_edge ]
  %indvars.iv2131 = phi i64 [ %indvars.iv.next22, %.preheader1._crit_edge ], [ 0, %.preheader2.preheader.preheader ]
  %3 = zext i2 %indvars.iv to i64
  %4 = add nsw i64 %indvars.iv2131, -1
  %exitcond1225 = icmp eq i64 %indvars.iv2131, 0
  br i1 %exitcond1225, label %.preheader1._crit_edge, label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader2.preheader
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 0
  %.pre37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 0
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 0
  br label %.preheader.preheader

.lr.ph30:                                         ; preds = %.preheader2
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 %indvars.iv2131
  %.pre36 = load double, double* %6, align 8
  %xtraiter38 = and i64 %indvars.iv2131, 3
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %.preheader1.prol.loopexit, label %.preheader1.prol.preheader

.preheader1.prol.preheader:                       ; preds = %.lr.ph30
  br label %.preheader1.prol

.preheader1.prol:                                 ; preds = %.preheader1.prol, %.preheader1.prol.preheader
  %7 = phi double [ %.pre36, %.preheader1.prol.preheader ], [ %11, %.preheader1.prol ]
  %indvars.iv1329.prol = phi i64 [ 0, %.preheader1.prol.preheader ], [ %indvars.iv.next14.prol, %.preheader1.prol ]
  %prol.iter = phi i64 [ %xtraiter38, %.preheader1.prol.preheader ], [ %prol.iter.sub, %.preheader1.prol ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 %indvars.iv1329.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %6, align 8
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv1329.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader1.prol.loopexit.unr-lcssa, label %.preheader1.prol, !llvm.loop !23

.preheader1.prol.loopexit.unr-lcssa:              ; preds = %.preheader1.prol
  br label %.preheader1.prol.loopexit

.preheader1.prol.loopexit:                        ; preds = %.lr.ph30, %.preheader1.prol.loopexit.unr-lcssa
  %.unr40 = phi double [ %.pre36, %.lr.ph30 ], [ %11, %.preheader1.prol.loopexit.unr-lcssa ]
  %indvars.iv1329.unr = phi i64 [ 0, %.lr.ph30 ], [ %3, %.preheader1.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %4, 3
  br i1 %12, label %.preheader1._crit_edge.loopexit, label %.lr.ph30.new

.lr.ph30.new:                                     ; preds = %.preheader1.prol.loopexit
  br label %.preheader1

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader2
  %indvars.iv726 = phi i64 [ %indvars.iv.next8, %.preheader2 ], [ 0, %.preheader.preheader.preheader ]
  %exitcond23 = icmp eq i64 %indvars.iv726, 0
  br i1 %exitcond23, label %.preheader.preheader..preheader2_crit_edge, label %.lr.ph

.preheader.preheader..preheader2_crit_edge:       ; preds = %.preheader.preheader
  %.pre35 = load double, double* %.phi.trans.insert, align 8
  br label %.preheader2

.lr.ph:                                           ; preds = %.preheader.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 %indvars.iv726
  %.pre = load double, double* %13, align 8
  %xtraiter = and i64 %indvars.iv726, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.lr.ph
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader
  %14 = load double, double* %5, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv726, i64 0
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %13, align 8
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph, %.preheader.prol
  %.lcssa.unr.ph = phi double [ %18, %.preheader.prol ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %18, %.preheader.prol ], [ %.pre, %.lr.ph ]
  %indvars.iv24.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.lr.ph ]
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %indvars.iv726, 1
  br i1 %19, label %.preheader2.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.lr.ph.new
  %20 = phi double [ %.unr.ph, %.lr.ph.new ], [ %32, %.preheader ]
  %indvars.iv24 = phi i64 [ %indvars.iv24.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %.preheader ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 %indvars.iv24
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv726, i64 %indvars.iv24
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv24, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv726, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv24, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv726
  br i1 %exitcond.1, label %.preheader2.loopexit.unr-lcssa, label %.preheader

.preheader2.loopexit.unr-lcssa:                   ; preds = %.preheader
  br label %.preheader2.loopexit

.preheader2.loopexit:                             ; preds = %.preheader.prol.loopexit, %.preheader2.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.preheader.prol.loopexit ], [ %32, %.preheader2.loopexit.unr-lcssa ]
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.loopexit, %.preheader.preheader..preheader2_crit_edge
  %.pre-phi = phi double* [ %.pre37, %.preheader.preheader..preheader2_crit_edge ], [ %13, %.preheader2.loopexit ]
  %33 = phi double [ %.pre35, %.preheader.preheader..preheader2_crit_edge ], [ %.lcssa, %.preheader2.loopexit ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv726, i64 %indvars.iv726
  %35 = load double, double* %34, align 8
  %36 = fdiv double %33, %35
  store double %36, double* %.pre-phi, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv726, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next8, %indvars.iv2131
  br i1 %exitcond12, label %.lr.ph30, label %.preheader.preheader

.preheader1:                                      ; preds = %.preheader1, %.lr.ph30.new
  %37 = phi double [ %.unr40, %.lr.ph30.new ], [ %53, %.preheader1 ]
  %indvars.iv1329 = phi i64 [ %indvars.iv1329.unr, %.lr.ph30.new ], [ %indvars.iv.next14.3, %.preheader1 ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 %indvars.iv1329
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fsub double %37, %40
  store double %41, double* %6, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1329, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 %indvars.iv.next14
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %6, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1329, 2
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 %indvars.iv.next14.1
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %6, align 8
  %indvars.iv.next14.2 = add nsw i64 %indvars.iv1329, 3
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 %indvars.iv.next14.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %6, align 8
  %indvars.iv.next14.3 = add nsw i64 %indvars.iv1329, 4
  %exitcond20.3 = icmp eq i64 %indvars.iv.next14.3, %indvars.iv2131
  br i1 %exitcond20.3, label %.preheader1._crit_edge.loopexit.unr-lcssa, label %.preheader1

.preheader1._crit_edge.loopexit.unr-lcssa:        ; preds = %.preheader1
  br label %.preheader1._crit_edge.loopexit

.preheader1._crit_edge.loopexit:                  ; preds = %.preheader1.prol.loopexit, %.preheader1._crit_edge.loopexit.unr-lcssa
  br label %.preheader1._crit_edge

.preheader1._crit_edge:                           ; preds = %.preheader1._crit_edge.loopexit, %.preheader2.preheader
  %54 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv2131, i64 %indvars.iv2131
  %55 = load double, double* %54, align 8
  %56 = tail call double @sqrt(double %55) #3
  store double %56, double* %54, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2131, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next22, 2000
  %indvars.iv.next43 = add i2 %indvars.iv, 1
  br i1 %exitcond33, label %._crit_edge.loopexit, label %.preheader2.preheader

._crit_edge.loopexit:                             ; preds = %.preheader1._crit_edge
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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %18
  %indvars.iv39 = phi i64 [ %indvars.iv.next4, %18 ], [ 1, %.preheader.preheader.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next6, %18 ], [ 0, %.preheader.preheader.preheader ]
  %7 = mul nsw i64 %indvars.iv58, 2000
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader, %.preheader.preheader
  %indvars.iv7 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %8 = add nsw i64 %indvars.iv7, %7
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
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv7
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv39
  br i1 %exitcond, label %18, label %.preheader._crit_edge

; <label>:18:                                     ; preds = %.preheader
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next6, 2000
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv39, 1
  br i1 %exitcond10, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %18
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

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
