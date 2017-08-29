; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %3) #4
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
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  tail call void @free(i8* %54) #4
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader6.preheader.lr.ph, label %._crit_edge

.preheader6.preheader.lr.ph:                      ; preds = %2
  br label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %.preheader5._crit_edge, %.preheader6.preheader.lr.ph
  %indvars.iv2638 = phi i64 [ 0, %.preheader6.preheader.lr.ph ], [ %indvars.iv.next27, %.preheader5._crit_edge ]
  %exitcond1430 = icmp eq i64 %indvars.iv2638, 0
  br i1 %exitcond1430, label %.preheader5.preheader, label %.preheader4.preheader.preheader

.preheader4.preheader.preheader:                  ; preds = %.preheader6.preheader
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2638, i64 0
  br label %.preheader4.preheader

.preheader5.preheader.loopexit:                   ; preds = %.preheader6
  br label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.preheader.loopexit, %.preheader6.preheader
  %exitcond2535 = icmp eq i64 %indvars.iv2638, 2000
  %exitcond1932 = icmp eq i64 %indvars.iv2638, 0
  %or.cond = or i1 %exitcond2535, %exitcond1932
  br i1 %or.cond, label %.preheader5._crit_edge, label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader5.preheader
  %xtraiter42 = and i64 %indvars.iv2638, 1
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2638, i64 0
  %5 = icmp eq i64 %xtraiter42, 0
  %6 = icmp eq i64 %indvars.iv2638, 1
  br label %.preheader.preheader

.preheader4.preheader:                            ; preds = %.preheader4.preheader.preheader, %.preheader6
  %indvars.iv931 = phi i64 [ %indvars.iv.next10, %.preheader6 ], [ 0, %.preheader4.preheader.preheader ]
  %exitcond28 = icmp eq i64 %indvars.iv931, 0
  br i1 %exitcond28, label %.preheader6, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader4.preheader
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2638, i64 %indvars.iv931
  %xtraiter = and i64 %indvars.iv931, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader4.prol.loopexit, label %.preheader4.prol

.preheader4.prol:                                 ; preds = %.lr.ph
  %8 = load double, double* %3, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv931
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = load double, double* %7, align 8
  %13 = fsub double %12, %11
  store double %13, double* %7, align 8
  br label %.preheader4.prol.loopexit

.preheader4.prol.loopexit:                        ; preds = %.preheader4.prol, %.lr.ph
  %indvars.iv29.unr.ph = phi i64 [ 1, %.preheader4.prol ], [ 0, %.lr.ph ]
  %14 = icmp eq i64 %indvars.iv931, 1
  br i1 %14, label %.preheader6, label %.preheader4.preheader49

.preheader4.preheader49:                          ; preds = %.preheader4.prol.loopexit
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader49, %.preheader4
  %indvars.iv29 = phi i64 [ %indvars.iv.next.1, %.preheader4 ], [ %indvars.iv29.unr.ph, %.preheader4.preheader49 ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2638, i64 %indvars.iv29
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv29, i64 %indvars.iv931
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = load double, double* %7, align 8
  %21 = fsub double %20, %19
  store double %21, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv29, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2638, i64 %indvars.iv.next
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv931
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %7, align 8
  %28 = fsub double %27, %26
  store double %28, double* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv29, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv931
  br i1 %exitcond.1, label %.preheader6.loopexit, label %.preheader4

.preheader6.loopexit:                             ; preds = %.preheader4
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader6.loopexit, %.preheader4.prol.loopexit, %.preheader4.preheader
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv931, i64 %indvars.iv931
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2638, i64 %indvars.iv931
  %32 = load double, double* %31, align 8
  %33 = fdiv double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv931, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next10, %indvars.iv2638
  br i1 %exitcond14, label %.preheader5.preheader.loopexit, label %.preheader4.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader5
  %indvars.iv2236 = phi i64 [ %indvars.iv.next23, %.preheader5 ], [ %indvars.iv2638, %.preheader.preheader.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2638, i64 %indvars.iv2236
  br i1 %5, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  %35 = load double, double* %4, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv2236
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = load double, double* %34, align 8
  %40 = fsub double %39, %38
  store double %40, double* %34, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader
  %indvars.iv1533.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 %6, label %.preheader5, label %.preheader.preheader48

.preheader.preheader48:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader48, %.preheader
  %indvars.iv1533 = phi i64 [ %indvars.iv.next16.1, %.preheader ], [ %indvars.iv1533.unr.ph, %.preheader.preheader48 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2638, i64 %indvars.iv1533
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1533, i64 %indvars.iv2236
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = load double, double* %34, align 8
  %47 = fsub double %46, %45
  store double %47, double* %34, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1533, 1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2638, i64 %indvars.iv.next16
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next16, i64 %indvars.iv2236
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = load double, double* %34, align 8
  %54 = fsub double %53, %52
  store double %54, double* %34, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv1533, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next16.1, %indvars.iv2638
  br i1 %exitcond19.1, label %.preheader5.loopexit, label %.preheader

.preheader5.loopexit:                             ; preds = %.preheader
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2236, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond25, label %.preheader5._crit_edge.loopexit, label %.preheader.preheader

.preheader5._crit_edge.loopexit:                  ; preds = %.preheader5
  br label %.preheader5._crit_edge

.preheader5._crit_edge:                           ; preds = %.preheader5._crit_edge.loopexit, %.preheader5.preheader
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv2638, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader6.preheader

._crit_edge.loopexit:                             ; preds = %.preheader5._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %7 = mul nsw i64 %indvars.iv26, 2000
  br label %8

; <label>:8:                                      ; preds = %.preheader.preheader, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %9 = add nsw i64 %indvars.iv5, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.preheader

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %.preheader

.preheader:                                       ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %.preheader._crit_edge, label %8

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond9, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
