; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader14.preheader.lr.ph, label %._crit_edge88.thread

._crit_edge88.thread:                             ; preds = %2
  br label %._crit_edge

.preheader14.preheader.lr.ph:                     ; preds = %2
  br label %.preheader14.preheader

.preheader14.preheader:                           ; preds = %.preheader13._crit_edge, %.preheader14.preheader.lr.ph
  %indvars.iv4587 = phi i64 [ 1, %.preheader14.preheader.lr.ph ], [ %indvars.iv.next46, %.preheader13._crit_edge ]
  %indvars.iv4786 = phi i64 [ 0, %.preheader14.preheader.lr.ph ], [ %indvars.iv.next48, %.preheader13._crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv4786, 2001
  %4 = add nuw nsw i64 %3, 1
  %scevgep102 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %4
  %5 = mul nsw i64 %indvars.iv4786, -8
  %6 = add nsw i64 %5, 15992
  br label %.preheader14

.preheader13.preheader:                           ; preds = %.preheader14
  %exitcond4483 = icmp eq i64 %indvars.iv4786, 1999
  br i1 %exitcond4483, label %.preheader13._crit_edge, label %.preheader13._crit_edge.loopexit

.preheader14:                                     ; preds = %.preheader14.preheader, %.preheader14
  %indvars.iv3381 = phi i64 [ 0, %.preheader14.preheader ], [ %indvars.iv.next34, %.preheader14 ]
  %7 = sub nsw i64 0, %indvars.iv3381
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4786, i64 %indvars.iv3381
  store double %12, double* %13, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3381, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %indvars.iv4587
  br i1 %exitcond38, label %.preheader13.preheader, label %.preheader14

.preheader13._crit_edge.loopexit:                 ; preds = %.preheader13.preheader
  %14 = bitcast double* %scevgep102 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %14, i8 0, i64 %6, i32 8, i1 false)
  br label %.preheader13._crit_edge

.preheader13._crit_edge:                          ; preds = %.preheader13._crit_edge.loopexit, %.preheader13.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4786, i64 %indvars.iv4786
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv4786, 1
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv4587, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond104, label %._crit_edge88, label %.preheader14.preheader

._crit_edge88:                                    ; preds = %.preheader13._crit_edge
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br i1 true, label %.preheader12.preheader.preheader, label %._crit_edge

.preheader12.preheader.preheader:                 ; preds = %._crit_edge88
  br i1 true, label %.preheader12.preheader.prol.loopexit, label %.preheader12._crit_edge.prol.preheader

.preheader12._crit_edge.prol.preheader:           ; preds = %.preheader12.preheader.preheader
  br label %.preheader12._crit_edge.prol

.preheader12._crit_edge.prol:                     ; preds = %.preheader12._crit_edge.prol.preheader, %.preheader12._crit_edge.prol
  br i1 true, label %.preheader12.preheader.prol.loopexit.loopexit, label %.preheader12._crit_edge.prol, !llvm.loop !1

.preheader12.preheader.prol.loopexit.loopexit:    ; preds = %.preheader12._crit_edge.prol
  br label %.preheader12.preheader.prol.loopexit

.preheader12.preheader.prol.loopexit:             ; preds = %.preheader12.preheader.prol.loopexit.loopexit, %.preheader12.preheader.preheader
  br i1 false, label %.preheader11, label %.preheader12._crit_edge.3.preheader

.preheader12._crit_edge.3.preheader:              ; preds = %.preheader12.preheader.prol.loopexit
  br i1 false, label %.preheader12._crit_edge.3.prol.preheader, label %.preheader12._crit_edge.3.prol.loopexit

.preheader12._crit_edge.3.prol.preheader:         ; preds = %.preheader12._crit_edge.3.preheader
  br label %.preheader12._crit_edge.3.prol

.preheader12._crit_edge.3.prol:                   ; preds = %.preheader12._crit_edge.3.prol.preheader
  br label %.preheader12._crit_edge.3.prol.loopexit

.preheader12._crit_edge.3.prol.loopexit:          ; preds = %.preheader12._crit_edge.3.prol, %.preheader12._crit_edge.3.preheader
  %indvars.iv3179.unr120 = phi i64 [ 0, %.preheader12._crit_edge.3.preheader ], [ 4, %.preheader12._crit_edge.3.prol ]
  br i1 false, label %.preheader11.loopexit, label %.preheader12._crit_edge.3.preheader.new

.preheader12._crit_edge.3.preheader.new:          ; preds = %.preheader12._crit_edge.3.prol.loopexit
  br label %.preheader12._crit_edge.3

.preheader11.loopexit.unr-lcssa:                  ; preds = %.preheader12._crit_edge.3
  br label %.preheader11.loopexit

.preheader11.loopexit:                            ; preds = %.preheader12._crit_edge.3.prol.loopexit, %.preheader11.loopexit.unr-lcssa
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.loopexit, %.preheader12.preheader.prol.loopexit
  br i1 true, label %.preheader10.preheader.preheader, label %._crit_edge

.preheader10.preheader.preheader:                 ; preds = %.preheader11
  %17 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader9.preheader.preheader

.preheader9.preheader.preheader:                  ; preds = %.preheader10.preheader.preheader, %.preheader10._crit_edge
  %indvars.iv2559 = phi i64 [ %indvars.iv.next26, %.preheader10._crit_edge ], [ 0, %.preheader10.preheader.preheader ]
  br label %.preheader9.preheader

.preheader8:                                      ; preds = %.preheader10._crit_edge
  br i1 true, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader8
  %18 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader.preheader

.preheader9.preheader:                            ; preds = %.preheader9.preheader.preheader, %.preheader10
  %indvars.iv2157 = phi i64 [ %indvars.iv.next22, %.preheader10 ], [ 0, %.preheader9.preheader.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2157, i64 %indvars.iv2559
  br i1 true, label %.preheader9.prol.loopexit, label %.preheader9.prol

.preheader9.prol:                                 ; preds = %.preheader9.preheader
  br label %.preheader9.prol.loopexit

.preheader9.prol.loopexit:                        ; preds = %.preheader9.prol, %.preheader9.preheader
  %indvars.iv1754.unr.ph = phi i64 [ 1, %.preheader9.prol ], [ 0, %.preheader9.preheader ]
  br i1 false, label %.preheader10, label %.preheader9.preheader116

.preheader9.preheader116:                         ; preds = %.preheader9.prol.loopexit
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.preheader116, %.preheader9
  %indvars.iv1754 = phi i64 [ %indvars.iv.next18.1, %.preheader9 ], [ %indvars.iv1754.unr.ph, %.preheader9.preheader116 ]
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1754, i64 %indvars.iv2559
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv2157, i64 %indvars.iv1754
  %25 = load double, double* %24, align 8
  %26 = fadd double %25, %23
  store double %26, double* %24, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1754, 1
  %27 = load double, double* %19, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next18, i64 %indvars.iv2559
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv2157, i64 %indvars.iv.next18
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv1754, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next18.1, 2000
  br i1 %exitcond20.1, label %.preheader10.loopexit, label %.preheader9

.preheader10.loopexit:                            ; preds = %.preheader9
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader9.prol.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2157, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond24, label %.preheader10._crit_edge, label %.preheader9.preheader

.preheader10._crit_edge:                          ; preds = %.preheader10
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2559, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next26, 2000
  br i1 %exitcond97, label %.preheader8, label %.preheader9.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv1551 = phi i64 [ %indvars.iv.next16, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  br i1 true, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader, %.preheader.prol
  br i1 true, label %.preheader.prol.loopexit.loopexit, label %.preheader.prol, !llvm.loop !3

.preheader.prol.loopexit.loopexit:                ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.loopexit, %.preheader.preheader
  br i1 false, label %.preheader._crit_edge, label %.preheader.preheader115

.preheader.preheader115:                          ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader115, %.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next.3, %.preheader ], [ 0, %.preheader.preheader115 ]
  %34 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv50
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv50
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next = or i64 %indvars.iv50, 1
  %39 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next
  %40 = bitcast double* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next
  %43 = bitcast double* %42 to i64*
  store i64 %41, i64* %43, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv50, 2
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next.1
  %45 = bitcast double* %44 to i64*
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next.1
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv50, 3
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv1551, i64 %indvars.iv.next.2
  %50 = bitcast double* %49 to i64*
  %51 = load i64, i64* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1551, i64 %indvars.iv.next.2
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv50, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %.preheader._crit_edge.loopexit, label %.preheader

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1551, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge88, %._crit_edge88.thread, %.preheader11, %.preheader8
  %54 = phi i8* [ %16, %.preheader8 ], [ %16, %.preheader11 ], [ %16, %._crit_edge88 ], [ undef, %._crit_edge88.thread ], [ %16, %._crit_edge.loopexit ]
  tail call void @free(i8* %54) #3
  ret void

.preheader12._crit_edge.3:                        ; preds = %.preheader12._crit_edge.3, %.preheader12._crit_edge.3.preheader.new
  %indvars.iv3179 = phi i64 [ %indvars.iv3179.unr120, %.preheader12._crit_edge.3.preheader.new ], [ %indvars.iv.next32.3.1, %.preheader12._crit_edge.3 ]
  %55 = mul nuw nsw i64 %indvars.iv3179, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %55
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %56 = mul i64 %indvars.iv3179, 16000
  %57 = add i64 %56, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %58 = mul i64 %indvars.iv3179, 16000
  %59 = add i64 %58, 32000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %59
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %60 = mul i64 %indvars.iv3179, 16000
  %61 = add i64 %60, 48000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %61
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.3 = add nsw i64 %indvars.iv3179, 4
  %62 = mul nuw nsw i64 %indvars.iv.next32.3, 16000
  %scevgep.1121 = getelementptr i8, i8* %16, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1121, i8 0, i64 16000, i32 8, i1 false)
  %63 = mul i64 %indvars.iv.next32.3, 16000
  %64 = add i64 %63, 16000
  %scevgep.1.1 = getelementptr i8, i8* %16, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %65 = mul i64 %indvars.iv.next32.3, 16000
  %66 = add i64 %65, 32000
  %scevgep.2.1 = getelementptr i8, i8* %16, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %67 = mul i64 %indvars.iv.next32.3, 16000
  %68 = add i64 %67, 48000
  %scevgep.3.1 = getelementptr i8, i8* %16, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next32.3.1 = add nsw i64 %indvars.iv3179, 8
  %exitcond98.3.1 = icmp eq i64 %indvars.iv.next32.3.1, 2000
  br i1 %exitcond98.3.1, label %.preheader11.loopexit.unr-lcssa, label %.preheader12._crit_edge.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader4.preheader.preheader, label %._crit_edge

.preheader4.preheader.preheader:                  ; preds = %2
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.preheader.preheader, %.preheader3._crit_edge
  %indvars.iv1827 = phi i64 [ %indvars.iv.next19, %.preheader3._crit_edge ], [ 0, %.preheader4.preheader.preheader ]
  %3 = add i64 %indvars.iv1827, -2
  %exitcond1222 = icmp eq i64 %indvars.iv1827, 0
  br i1 %exitcond1222, label %.preheader3._crit_edge, label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader4.preheader
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 0
  br label %.preheader.preheader

.preheader3.preheader:                            ; preds = %.preheader4
  %exitcond1724 = icmp eq i64 %indvars.iv1827, 0
  br i1 %exitcond1724, label %.preheader3._crit_edge, label %.lr.ph26

.lr.ph26:                                         ; preds = %.preheader3.preheader
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1827
  %xtraiter28 = and i64 %indvars.iv1827, 1
  %lcmp.mod29 = icmp eq i64 %xtraiter28, 0
  br i1 %lcmp.mod29, label %.preheader3.prol.loopexit, label %.preheader3.prol

.preheader3.prol:                                 ; preds = %.lr.ph26
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 0
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %7
  %9 = load double, double* %5, align 8
  %10 = fsub double %9, %8
  store double %10, double* %5, align 8
  br label %.preheader3.prol.loopexit

.preheader3.prol.loopexit:                        ; preds = %.preheader3.prol, %.lr.ph26
  %indvars.iv1325.unr.ph = phi i64 [ 1, %.preheader3.prol ], [ 0, %.lr.ph26 ]
  %11 = icmp eq i64 %indvars.iv1827, 1
  br i1 %11, label %.preheader3._crit_edge, label %.preheader3.preheader36

.preheader3.preheader36:                          ; preds = %.preheader3.prol.loopexit
  %12 = sub i64 %3, %indvars.iv1325.unr.ph
  %13 = lshr i64 %12, 1
  %14 = and i64 %13, 1
  %lcmp.mod39 = icmp eq i64 %14, 0
  br i1 %lcmp.mod39, label %.preheader3.prol.preheader, label %.preheader3.prol.loopexit37.unr-lcssa

.preheader3.prol.preheader:                       ; preds = %.preheader3.preheader36
  br label %.preheader3.prol40

.preheader3.prol40:                               ; preds = %.preheader3.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1325.unr.ph
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %16
  %18 = load double, double* %5, align 8
  %19 = fsub double %18, %17
  store double %19, double* %5, align 8
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv1325.unr.ph, 1
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14.prol
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %21
  %23 = fsub double %19, %22
  store double %23, double* %5, align 8
  %indvars.iv.next14.1.prol = or i64 %indvars.iv1325.unr.ph, 2
  br label %.preheader3.prol.loopexit37.unr-lcssa

.preheader3.prol.loopexit37.unr-lcssa:            ; preds = %.preheader3.preheader36, %.preheader3.prol40
  %indvars.iv1325.unr.ph41 = phi i64 [ %indvars.iv.next14.1.prol, %.preheader3.prol40 ], [ %indvars.iv1325.unr.ph, %.preheader3.preheader36 ]
  br label %.preheader3.prol.loopexit37

.preheader3.prol.loopexit37:                      ; preds = %.preheader3.prol.loopexit37.unr-lcssa
  %24 = icmp eq i64 %13, 0
  br i1 %24, label %.preheader3._crit_edge.loopexit, label %.preheader3.preheader36.new

.preheader3.preheader36.new:                      ; preds = %.preheader3.prol.loopexit37
  br label %.preheader3

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader4
  %indvars.iv723 = phi i64 [ %indvars.iv.next8, %.preheader4 ], [ 0, %.preheader.preheader.preheader ]
  %exitcond20 = icmp eq i64 %indvars.iv723, 0
  br i1 %exitcond20, label %.preheader4, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader.preheader
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv723
  %xtraiter = and i64 %indvars.iv723, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.lr.ph
  %26 = load double, double* %4, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 0
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = load double, double* %25, align 8
  %31 = fsub double %30, %29
  store double %31, double* %25, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.lr.ph
  %indvars.iv21.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.lr.ph ]
  %32 = icmp eq i64 %indvars.iv723, 1
  br i1 %32, label %.preheader4, label %.preheader.preheader35

.preheader.preheader35:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader35, %.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv.next.1, %.preheader ], [ %indvars.iv21.unr.ph, %.preheader.preheader35 ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv21
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv21
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = load double, double* %25, align 8
  %39 = fsub double %38, %37
  store double %39, double* %25, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = load double, double* %25, align 8
  %46 = fsub double %45, %44
  store double %46, double* %25, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv723
  br i1 %exitcond.1, label %.preheader4.loopexit, label %.preheader

.preheader4.loopexit:                             ; preds = %.preheader
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader.prol.loopexit, %.preheader.preheader
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv723, i64 %indvars.iv723
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv723
  %50 = load double, double* %49, align 8
  %51 = fdiv double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv723, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next8, %indvars.iv1827
  br i1 %exitcond12, label %.preheader3.preheader, label %.preheader.preheader

.preheader3:                                      ; preds = %.preheader3, %.preheader3.preheader36.new
  %indvars.iv1325 = phi i64 [ %indvars.iv1325.unr.ph41, %.preheader3.preheader36.new ], [ %indvars.iv.next14.1.1, %.preheader3 ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1325
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = load double, double* %5, align 8
  %56 = fsub double %55, %54
  store double %56, double* %5, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1325, 1
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %58
  %60 = fsub double %56, %59
  store double %60, double* %5, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1325, 2
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14.1
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %62
  %64 = fsub double %60, %63
  store double %64, double* %5, align 8
  %indvars.iv.next14.142 = add nsw i64 %indvars.iv1325, 3
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv.next14.142
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, %66
  %68 = fsub double %64, %67
  store double %68, double* %5, align 8
  %indvars.iv.next14.1.1 = add nsw i64 %indvars.iv1325, 4
  %exitcond17.1.1 = icmp eq i64 %indvars.iv.next14.1.1, %indvars.iv1827
  br i1 %exitcond17.1.1, label %.preheader3._crit_edge.loopexit.unr-lcssa, label %.preheader3

.preheader3._crit_edge.loopexit.unr-lcssa:        ; preds = %.preheader3
  br label %.preheader3._crit_edge.loopexit

.preheader3._crit_edge.loopexit:                  ; preds = %.preheader3.prol.loopexit37, %.preheader3._crit_edge.loopexit.unr-lcssa
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader3._crit_edge.loopexit, %.preheader4.preheader, %.preheader3.prol.loopexit, %.preheader3.preheader
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1827, i64 %indvars.iv1827
  %70 = load double, double* %69, align 8
  %71 = tail call double @sqrt(double %70) #3
  store double %71, double* %69, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1827, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader4.preheader

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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %19
  %indvars.iv410 = phi i64 [ %indvars.iv.next5, %19 ], [ 1, %.preheader.preheader.preheader ]
  %indvars.iv69 = phi i64 [ %indvars.iv.next7, %19 ], [ 0, %.preheader.preheader.preheader ]
  %7 = mul nsw i64 %indvars.iv69, 2000
  br label %8

; <label>:8:                                      ; preds = %.preheader.preheader, %.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %9 = add nsw i64 %indvars.iv8, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.preheader

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %.preheader

.preheader:                                       ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69, i64 %indvars.iv8
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv410
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %.preheader
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv69, 1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond11, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %19
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

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
!3 = distinct !{!3, !2}
