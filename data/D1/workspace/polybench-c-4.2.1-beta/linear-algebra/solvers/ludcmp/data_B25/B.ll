; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(i32 2000, double* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br i1 true, label %.lr.ph95.preheader, label %._crit_edge92.thread

.lr.ph95.preheader:                               ; preds = %5
  br i1 true, label %.lr.ph95.prol.loopexit, label %.lr.ph95.prol

.lr.ph95.prol:                                    ; preds = %.lr.ph95.preheader
  br label %.lr.ph95.prol.loopexit

.lr.ph95.prol.loopexit:                           ; preds = %.lr.ph95.preheader, %.lr.ph95.prol
  %indvars.iv5193.unr = phi i64 [ 0, %.lr.ph95.preheader ], [ 1, %.lr.ph95.prol ]
  br i1 false, label %.preheader15.preheader.lr.ph, label %.lr.ph95.preheader130

.lr.ph95.preheader130:                            ; preds = %.lr.ph95.prol.loopexit
  br label %.lr.ph95

.preheader16:                                     ; preds = %.lr.ph95
  br i1 true, label %.preheader15.preheader.lr.ph, label %._crit_edge92.thread

.preheader15.preheader.lr.ph:                     ; preds = %.lr.ph95.prol.loopexit, %.preheader16
  %6 = phi i64 [ 2000, %.preheader16 ], [ 1, %.lr.ph95.prol.loopexit ]
  br label %.preheader15.preheader

.lr.ph95:                                         ; preds = %.lr.ph95.preheader130, %.lr.ph95
  %indvars.iv5193 = phi i64 [ %indvars.iv.next52.1, %.lr.ph95 ], [ %indvars.iv5193.unr, %.lr.ph95.preheader130 ]
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv5193
  %8 = bitcast double* %7 to <2 x double>*
  %9 = getelementptr inbounds double, double* %4, i64 %indvars.iv5193
  %10 = bitcast double* %9 to <2 x double>*
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv5193, 1
  %11 = trunc i64 %indvars.iv.next52 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv5193
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  store <2 x double> zeroinitializer, <2 x double>* %10, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv5193, 2
  %14 = trunc i64 %indvars.iv.next52.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %12, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = fmul <2 x double> %18, <double 5.000000e-01, double 5.000000e-01>
  %20 = fadd <2 x double> %19, <double 4.000000e+00, double 4.000000e+00>
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %exitcond112.1 = icmp eq i64 %indvars.iv.next52.1, 2000
  br i1 %exitcond112.1, label %.preheader16, label %.lr.ph95

.preheader15.preheader:                           ; preds = %.preheader14._crit_edge, %.preheader15.preheader.lr.ph
  %indvars.iv4791 = phi i64 [ 1, %.preheader15.preheader.lr.ph ], [ %indvars.iv.next48, %.preheader14._crit_edge ]
  %indvars.iv4990 = phi i64 [ 0, %.preheader15.preheader.lr.ph ], [ %indvars.iv.next50, %.preheader14._crit_edge ]
  %22 = mul nuw nsw i64 %indvars.iv4990, 2001
  %23 = add nuw nsw i64 %22, 1
  %scevgep109 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %23
  %24 = mul nsw i64 %indvars.iv4990, -8
  %25 = add nsw i64 %24, 15992
  br label %.preheader15

.preheader14.preheader:                           ; preds = %.preheader15
  %exitcond4687 = icmp eq i64 %indvars.iv4990, 1999
  br i1 %exitcond4687, label %.preheader14._crit_edge, label %.preheader14._crit_edge.loopexit

.preheader15:                                     ; preds = %.preheader15.preheader, %.preheader15
  %indvars.iv3585 = phi i64 [ 0, %.preheader15.preheader ], [ %indvars.iv.next36, %.preheader15 ]
  %26 = sub nsw i64 0, %indvars.iv3585
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.000000e+03
  %31 = fadd double %30, 1.000000e+00
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4990, i64 %indvars.iv3585
  store double %31, double* %32, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv3585, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next36, %indvars.iv4791
  br i1 %exitcond40, label %.preheader14.preheader, label %.preheader15

.preheader14._crit_edge.loopexit:                 ; preds = %.preheader14.preheader
  %33 = bitcast double* %scevgep109 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %33, i8 0, i64 %25, i32 8, i1 false)
  br label %.preheader14._crit_edge

.preheader14._crit_edge:                          ; preds = %.preheader14._crit_edge.loopexit, %.preheader14.preheader
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4990, i64 %indvars.iv4990
  store double 1.000000e+00, double* %34, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv4990, 1
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv4791, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next50, %6
  br i1 %exitcond111, label %._crit_edge92, label %.preheader15.preheader

._crit_edge92.thread:                             ; preds = %.preheader16, %5
  br label %._crit_edge

._crit_edge92:                                    ; preds = %.preheader14._crit_edge
  %35 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 true, label %.preheader13.preheader.preheader, label %._crit_edge

.preheader13.preheader.preheader:                 ; preds = %._crit_edge92
  br i1 true, label %.preheader13.preheader.prol.loopexit, label %.preheader13._crit_edge.prol.preheader

.preheader13._crit_edge.prol.preheader:           ; preds = %.preheader13.preheader.preheader
  br label %.preheader13._crit_edge.prol

.preheader13._crit_edge.prol:                     ; preds = %.preheader13._crit_edge.prol.preheader, %.preheader13._crit_edge.prol
  br i1 true, label %.preheader13.preheader.prol.loopexit.loopexit, label %.preheader13._crit_edge.prol, !llvm.loop !1

.preheader13.preheader.prol.loopexit.loopexit:    ; preds = %.preheader13._crit_edge.prol
  br label %.preheader13.preheader.prol.loopexit

.preheader13.preheader.prol.loopexit:             ; preds = %.preheader13.preheader.prol.loopexit.loopexit, %.preheader13.preheader.preheader
  br i1 false, label %.preheader12, label %.preheader13._crit_edge.3.preheader

.preheader13._crit_edge.3.preheader:              ; preds = %.preheader13.preheader.prol.loopexit
  br i1 false, label %.preheader13._crit_edge.3.prol.preheader, label %.preheader13._crit_edge.3.prol.loopexit

.preheader13._crit_edge.3.prol.preheader:         ; preds = %.preheader13._crit_edge.3.preheader
  br label %.preheader13._crit_edge.3.prol

.preheader13._crit_edge.3.prol:                   ; preds = %.preheader13._crit_edge.3.prol.preheader
  br label %.preheader13._crit_edge.3.prol.loopexit

.preheader13._crit_edge.3.prol.loopexit:          ; preds = %.preheader13._crit_edge.3.prol, %.preheader13._crit_edge.3.preheader
  %indvars.iv3383.unr134 = phi i64 [ 0, %.preheader13._crit_edge.3.preheader ], [ 4, %.preheader13._crit_edge.3.prol ]
  br i1 false, label %.preheader12.loopexit, label %.preheader13._crit_edge.3.preheader.new

.preheader13._crit_edge.3.preheader.new:          ; preds = %.preheader13._crit_edge.3.prol.loopexit
  br label %.preheader13._crit_edge.3

.preheader12.loopexit.unr-lcssa:                  ; preds = %.preheader13._crit_edge.3
  br label %.preheader12.loopexit

.preheader12.loopexit:                            ; preds = %.preheader13._crit_edge.3.prol.loopexit, %.preheader12.loopexit.unr-lcssa
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader12.loopexit, %.preheader13.preheader.prol.loopexit
  br i1 true, label %.preheader11.preheader.preheader, label %._crit_edge

.preheader11.preheader.preheader:                 ; preds = %.preheader12
  %36 = bitcast i8* %35 to [2000 x [2000 x double]]*
  br label %.preheader10.preheader.preheader

.preheader10.preheader.preheader:                 ; preds = %.preheader11.preheader.preheader, %.preheader11._crit_edge
  %indvars.iv2763 = phi i64 [ %indvars.iv.next28, %.preheader11._crit_edge ], [ 0, %.preheader11.preheader.preheader ]
  br label %.preheader10.preheader

.preheader9:                                      ; preds = %.preheader11._crit_edge
  br i1 true, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader9
  %37 = bitcast i8* %35 to [2000 x [2000 x double]]*
  br label %.preheader.preheader

.preheader10.preheader:                           ; preds = %.preheader10.preheader.preheader, %.preheader11
  %indvars.iv2361 = phi i64 [ %indvars.iv.next24, %.preheader11 ], [ 0, %.preheader10.preheader.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2361, i64 %indvars.iv2763
  br i1 true, label %.preheader10.prol.loopexit, label %.preheader10.prol

.preheader10.prol:                                ; preds = %.preheader10.preheader
  br label %.preheader10.prol.loopexit

.preheader10.prol.loopexit:                       ; preds = %.preheader10.prol, %.preheader10.preheader
  %indvars.iv1958.unr.ph = phi i64 [ 1, %.preheader10.prol ], [ 0, %.preheader10.preheader ]
  br i1 false, label %.preheader11, label %.preheader10.preheader129

.preheader10.preheader129:                        ; preds = %.preheader10.prol.loopexit
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.preheader129, %.preheader10
  %indvars.iv1958 = phi i64 [ %indvars.iv.next20.1, %.preheader10 ], [ %indvars.iv1958.unr.ph, %.preheader10.preheader129 ]
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1958, i64 %indvars.iv2763
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv2361, i64 %indvars.iv1958
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %43, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1958, 1
  %46 = load double, double* %38, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next20, i64 %indvars.iv2763
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv2361, i64 %indvars.iv.next20
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv1958, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next20.1, 2000
  br i1 %exitcond22.1, label %.preheader11.loopexit, label %.preheader10

.preheader11.loopexit:                            ; preds = %.preheader10
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.loopexit, %.preheader10.prol.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv2361, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 2000
  br i1 %exitcond26, label %.preheader11._crit_edge, label %.preheader10.preheader

.preheader11._crit_edge:                          ; preds = %.preheader11
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv2763, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next28, 2000
  br i1 %exitcond104, label %.preheader9, label %.preheader10.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv1755 = phi i64 [ %indvars.iv.next18, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  br i1 true, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader, %.preheader.prol
  br i1 true, label %.preheader.prol.loopexit.loopexit, label %.preheader.prol, !llvm.loop !3

.preheader.prol.loopexit.loopexit:                ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.loopexit, %.preheader.preheader
  br i1 false, label %.preheader._crit_edge, label %.preheader.preheader128

.preheader.preheader128:                          ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader128, %.preheader
  %indvars.iv54 = phi i64 [ %indvars.iv.next.3, %.preheader ], [ 0, %.preheader.preheader128 ]
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv1755, i64 %indvars.iv54
  %54 = bitcast double* %53 to i64*
  %55 = load i64, i64* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1755, i64 %indvars.iv54
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next = or i64 %indvars.iv54, 1
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv1755, i64 %indvars.iv.next
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1755, i64 %indvars.iv.next
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv54, 2
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv1755, i64 %indvars.iv.next.1
  %64 = bitcast double* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1755, i64 %indvars.iv.next.1
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv54, 3
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv1755, i64 %indvars.iv.next.2
  %69 = bitcast double* %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1755, i64 %indvars.iv.next.2
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv54, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %.preheader._crit_edge.loopexit, label %.preheader

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1755, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge92, %._crit_edge92.thread, %.preheader12, %.preheader9
  %73 = phi i8* [ %35, %.preheader9 ], [ %35, %.preheader12 ], [ %35, %._crit_edge92 ], [ undef, %._crit_edge92.thread ], [ %35, %._crit_edge.loopexit ]
  tail call void @free(i8* %73) #4
  ret void

.preheader13._crit_edge.3:                        ; preds = %.preheader13._crit_edge.3, %.preheader13._crit_edge.3.preheader.new
  %indvars.iv3383 = phi i64 [ %indvars.iv3383.unr134, %.preheader13._crit_edge.3.preheader.new ], [ %indvars.iv.next34.3.1, %.preheader13._crit_edge.3 ]
  %74 = mul nuw nsw i64 %indvars.iv3383, 16000
  %scevgep = getelementptr i8, i8* %35, i64 %74
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %75 = mul i64 %indvars.iv3383, 16000
  %76 = add i64 %75, 16000
  %scevgep.1 = getelementptr i8, i8* %35, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %77 = mul i64 %indvars.iv3383, 16000
  %78 = add i64 %77, 32000
  %scevgep.2 = getelementptr i8, i8* %35, i64 %78
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %79 = mul i64 %indvars.iv3383, 16000
  %80 = add i64 %79, 48000
  %scevgep.3 = getelementptr i8, i8* %35, i64 %80
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next34.3 = add nsw i64 %indvars.iv3383, 4
  %81 = mul nuw nsw i64 %indvars.iv.next34.3, 16000
  %scevgep.1135 = getelementptr i8, i8* %35, i64 %81
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1135, i8 0, i64 16000, i32 8, i1 false)
  %82 = mul i64 %indvars.iv.next34.3, 16000
  %83 = add i64 %82, 16000
  %scevgep.1.1 = getelementptr i8, i8* %35, i64 %83
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %84 = mul i64 %indvars.iv.next34.3, 16000
  %85 = add i64 %84, 32000
  %scevgep.2.1 = getelementptr i8, i8* %35, i64 %85
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %86 = mul i64 %indvars.iv.next34.3, 16000
  %87 = add i64 %86, 48000
  %scevgep.3.1 = getelementptr i8, i8* %35, i64 %87
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next34.3.1 = add nsw i64 %indvars.iv3383, 8
  %exitcond105.3.1 = icmp eq i64 %indvars.iv.next34.3.1, 2000
  br i1 %exitcond105.3.1, label %.preheader12.loopexit.unr-lcssa, label %.preheader13._crit_edge.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader12.preheader.lr.ph, label %._crit_edge51

.preheader12.preheader.lr.ph:                     ; preds = %5
  br label %.preheader12.preheader

.preheader12.preheader:                           ; preds = %.preheader11._crit_edge, %.preheader12.preheader.lr.ph
  %indvars.iv4383 = phi i64 [ 0, %.preheader12.preheader.lr.ph ], [ %indvars.iv.next44, %.preheader11._crit_edge ]
  %exitcond3168 = icmp eq i64 %indvars.iv4383, 0
  br i1 %exitcond3168, label %.preheader11.preheader, label %.lr.ph71.preheader

.lr.ph71.preheader:                               ; preds = %.preheader12.preheader
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4383, i64 0
  br label %.lr.ph71

.preheader10:                                     ; preds = %.preheader11._crit_edge
  br i1 true, label %.lr.ph60.preheader, label %._crit_edge51

.lr.ph60.preheader:                               ; preds = %.preheader10
  br label %.lr.ph60

.preheader11.preheader.loopexit:                  ; preds = %.preheader12
  br label %.preheader11.preheader

.preheader11.preheader:                           ; preds = %.preheader11.preheader.loopexit, %.preheader12.preheader
  %exitcond4279 = icmp eq i64 %indvars.iv4383, 2000
  %exitcond3672 = icmp eq i64 %indvars.iv4383, 0
  %or.cond = or i1 %exitcond4279, %exitcond3672
  br i1 %or.cond, label %.preheader11._crit_edge, label %.lr.ph82.split.preheader

.lr.ph82.split.preheader:                         ; preds = %.preheader11.preheader
  %xtraiter96 = and i64 %indvars.iv4383, 1
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4383, i64 0
  %8 = icmp eq i64 %xtraiter96, 0
  %9 = icmp eq i64 %indvars.iv4383, 1
  br label %.lr.ph82.split

.lr.ph71:                                         ; preds = %.lr.ph71.preheader, %.preheader12
  %indvars.iv2669 = phi i64 [ %indvars.iv.next27, %.preheader12 ], [ 0, %.lr.ph71.preheader ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4383, i64 %indvars.iv2669
  %11 = load double, double* %10, align 8
  %exitcond2561 = icmp eq i64 %indvars.iv2669, 0
  br i1 %exitcond2561, label %.preheader12, label %.lr.ph65.preheader

.lr.ph65.preheader:                               ; preds = %.lr.ph71
  %xtraiter94 = and i64 %indvars.iv2669, 1
  %lcmp.mod95 = icmp eq i64 %xtraiter94, 0
  br i1 %lcmp.mod95, label %.lr.ph65.prol.loopexit, label %.lr.ph65.prol

.lr.ph65.prol:                                    ; preds = %.lr.ph65.preheader
  %12 = load double, double* %6, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv2669
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %11, %15
  br label %.lr.ph65.prol.loopexit

.lr.ph65.prol.loopexit:                           ; preds = %.lr.ph65.prol, %.lr.ph65.preheader
  %.lcssa88.unr.ph = phi double [ %16, %.lr.ph65.prol ], [ undef, %.lr.ph65.preheader ]
  %.063.unr.ph = phi double [ %16, %.lr.ph65.prol ], [ %11, %.lr.ph65.preheader ]
  %indvars.iv2162.unr.ph = phi i64 [ 1, %.lr.ph65.prol ], [ 0, %.lr.ph65.preheader ]
  %17 = icmp eq i64 %indvars.iv2669, 1
  br i1 %17, label %.preheader12, label %.lr.ph65.preheader126

.lr.ph65.preheader126:                            ; preds = %.lr.ph65.prol.loopexit
  br label %.lr.ph65

.lr.ph65:                                         ; preds = %.lr.ph65.preheader126, %.lr.ph65
  %.063 = phi double [ %31, %.lr.ph65 ], [ %.063.unr.ph, %.lr.ph65.preheader126 ]
  %indvars.iv2162 = phi i64 [ %indvars.iv.next22.1, %.lr.ph65 ], [ %indvars.iv2162.unr.ph, %.lr.ph65.preheader126 ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4383, i64 %indvars.iv2162
  %19 = bitcast double* %18 to <2 x double>*
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2162, i64 %indvars.iv2669
  %21 = load double, double* %20, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2162, 1
  %22 = load <2 x double>, <2 x double>* %19, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next22, i64 %indvars.iv2669
  %24 = load double, double* %23, align 8
  %25 = insertelement <2 x double> undef, double %21, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fmul <2 x double> %22, %26
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fsub double %.063, %28
  %31 = fsub double %30, %29
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv2162, 2
  %exitcond25.1 = icmp eq i64 %indvars.iv.next22.1, %indvars.iv2669
  br i1 %exitcond25.1, label %.preheader12.loopexit, label %.lr.ph65

.preheader12.loopexit:                            ; preds = %.lr.ph65
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader12.loopexit, %.lr.ph65.prol.loopexit, %.lr.ph71
  %.0.lcssa = phi double [ %11, %.lr.ph71 ], [ %.lcssa88.unr.ph, %.lr.ph65.prol.loopexit ], [ %31, %.preheader12.loopexit ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv2669, i64 %indvars.iv2669
  %33 = load double, double* %32, align 8
  %34 = fdiv double %.0.lcssa, %33
  store double %34, double* %10, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv2669, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next27, %indvars.iv4383
  br i1 %exitcond31, label %.preheader11.preheader.loopexit, label %.lr.ph71

.lr.ph82.split:                                   ; preds = %.lr.ph82.split.preheader, %.preheader11
  %indvars.iv3980 = phi i64 [ %indvars.iv.next40, %.preheader11 ], [ %indvars.iv4383, %.lr.ph82.split.preheader ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4383, i64 %indvars.iv3980
  %36 = load double, double* %35, align 8
  br i1 %8, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph82.split
  %37 = load double, double* %7, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv3980
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %36, %40
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph82.split
  %.lcssa89.unr.ph = phi double [ %41, %.prol.preheader ], [ undef, %.lr.ph82.split ]
  %.174.unr.ph = phi double [ %41, %.prol.preheader ], [ %36, %.lr.ph82.split ]
  %indvars.iv3273.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph82.split ]
  br i1 %9, label %.preheader11, label %.lr.ph82.split.new.preheader

.lr.ph82.split.new.preheader:                     ; preds = %.prol.loopexit
  br label %.lr.ph82.split.new

.lr.ph82.split.new:                               ; preds = %.lr.ph82.split.new.preheader, %.lr.ph82.split.new
  %.174 = phi double [ %55, %.lr.ph82.split.new ], [ %.174.unr.ph, %.lr.ph82.split.new.preheader ]
  %indvars.iv3273 = phi i64 [ %indvars.iv.next33.1, %.lr.ph82.split.new ], [ %indvars.iv3273.unr.ph, %.lr.ph82.split.new.preheader ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4383, i64 %indvars.iv3273
  %43 = bitcast double* %42 to <2 x double>*
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3273, i64 %indvars.iv3980
  %45 = load double, double* %44, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv3273, 1
  %46 = load <2 x double>, <2 x double>* %43, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next33, i64 %indvars.iv3980
  %48 = load double, double* %47, align 8
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fmul <2 x double> %46, %50
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %54 = fsub double %.174, %52
  %55 = fsub double %54, %53
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv3273, 2
  %exitcond36.1 = icmp eq i64 %indvars.iv.next33.1, %indvars.iv4383
  br i1 %exitcond36.1, label %.preheader11.loopexit, label %.lr.ph82.split.new

.preheader11.loopexit:                            ; preds = %.lr.ph82.split.new
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.loopexit, %.prol.loopexit
  %.lcssa89 = phi double [ %.lcssa89.unr.ph, %.prol.loopexit ], [ %55, %.preheader11.loopexit ]
  store double %.lcssa89, double* %35, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv3980, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 2000
  br i1 %exitcond42, label %.preheader11._crit_edge.loopexit, label %.lr.ph82.split

.preheader11._crit_edge.loopexit:                 ; preds = %.preheader11
  br label %.preheader11._crit_edge

.preheader11._crit_edge:                          ; preds = %.preheader11._crit_edge.loopexit, %.preheader11.preheader
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv4383, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next44, 2000
  br i1 %exitcond98, label %.preheader10, label %.preheader12.preheader

.preheader:                                       ; preds = %._crit_edge57
  br i1 true, label %.lr.ph50.preheader, label %._crit_edge51

.lr.ph50.preheader:                               ; preds = %.preheader
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph50

.lr.ph60:                                         ; preds = %.lr.ph60.preheader, %._crit_edge57
  %indvars.iv1959 = phi i64 [ %indvars.iv.next20, %._crit_edge57 ], [ 0, %.lr.ph60.preheader ]
  %56 = add nsw i64 %indvars.iv1959, -1
  %57 = getelementptr inbounds double, double* %2, i64 %indvars.iv1959
  %58 = load double, double* %57, align 8
  %exitcond52 = icmp eq i64 %indvars.iv1959, 0
  br i1 %exitcond52, label %._crit_edge57, label %.lr.ph56.preheader

.lr.ph56.preheader:                               ; preds = %.lr.ph60
  %xtraiter91 = and i64 %indvars.iv1959, 3
  %lcmp.mod92 = icmp eq i64 %xtraiter91, 0
  br i1 %lcmp.mod92, label %.lr.ph56.prol.loopexit, label %.lr.ph56.prol.preheader

.lr.ph56.prol.preheader:                          ; preds = %.lr.ph56.preheader
  br label %.lr.ph56.prol

.lr.ph56.prol:                                    ; preds = %.lr.ph56.prol.preheader, %.lr.ph56.prol
  %.254.prol = phi double [ %64, %.lr.ph56.prol ], [ %58, %.lr.ph56.prol.preheader ]
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph56.prol ], [ 0, %.lr.ph56.prol.preheader ]
  %prol.iter93 = phi i64 [ %prol.iter93.sub, %.lr.ph56.prol ], [ %xtraiter91, %.lr.ph56.prol.preheader ]
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1959, i64 %indvars.iv53.prol
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds double, double* %4, i64 %indvars.iv53.prol
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fsub double %.254.prol, %63
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv53.prol, 1
  %prol.iter93.sub = add i64 %prol.iter93, -1
  %prol.iter93.cmp = icmp eq i64 %prol.iter93.sub, 0
  br i1 %prol.iter93.cmp, label %.lr.ph56.prol.loopexit.loopexit, label %.lr.ph56.prol, !llvm.loop !4

.lr.ph56.prol.loopexit.loopexit:                  ; preds = %.lr.ph56.prol
  br label %.lr.ph56.prol.loopexit

.lr.ph56.prol.loopexit:                           ; preds = %.lr.ph56.prol.loopexit.loopexit, %.lr.ph56.preheader
  %.lcssa87.unr = phi double [ undef, %.lr.ph56.preheader ], [ %64, %.lr.ph56.prol.loopexit.loopexit ]
  %.254.unr = phi double [ %58, %.lr.ph56.preheader ], [ %64, %.lr.ph56.prol.loopexit.loopexit ]
  %indvars.iv53.unr = phi i64 [ 0, %.lr.ph56.preheader ], [ %indvars.iv.next.prol, %.lr.ph56.prol.loopexit.loopexit ]
  %65 = icmp ult i64 %56, 3
  br i1 %65, label %._crit_edge57, label %.lr.ph56.preheader125

.lr.ph56.preheader125:                            ; preds = %.lr.ph56.prol.loopexit
  br label %.lr.ph56

.lr.ph56:                                         ; preds = %.lr.ph56.preheader125, %.lr.ph56
  %.254 = phi double [ %87, %.lr.ph56 ], [ %.254.unr, %.lr.ph56.preheader125 ]
  %indvars.iv53 = phi i64 [ %indvars.iv.next.3, %.lr.ph56 ], [ %indvars.iv53.unr, %.lr.ph56.preheader125 ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1959, i64 %indvars.iv53
  %67 = bitcast double* %66 to <2 x double>*
  %68 = getelementptr inbounds double, double* %4, i64 %indvars.iv53
  %69 = bitcast double* %68 to <2 x double>*
  %70 = load <2 x double>, <2 x double>* %67, align 8
  %71 = load <2 x double>, <2 x double>* %69, align 8
  %72 = fmul <2 x double> %70, %71
  %73 = extractelement <2 x double> %72, i32 0
  %74 = extractelement <2 x double> %72, i32 1
  %75 = fsub double %.254, %73
  %76 = fsub double %75, %74
  %indvars.iv.next.1 = add nsw i64 %indvars.iv53, 2
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1959, i64 %indvars.iv.next.1
  %78 = bitcast double* %77 to <2 x double>*
  %79 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %80 = bitcast double* %79 to <2 x double>*
  %81 = load <2 x double>, <2 x double>* %78, align 8
  %82 = load <2 x double>, <2 x double>* %80, align 8
  %83 = fmul <2 x double> %81, %82
  %84 = extractelement <2 x double> %83, i32 0
  %85 = extractelement <2 x double> %83, i32 1
  %86 = fsub double %76, %84
  %87 = fsub double %86, %85
  %indvars.iv.next.3 = add nsw i64 %indvars.iv53, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1959
  br i1 %exitcond.3, label %._crit_edge57.loopexit, label %.lr.ph56

._crit_edge57.loopexit:                           ; preds = %.lr.ph56
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge57.loopexit, %.lr.ph56.prol.loopexit, %.lr.ph60
  %.2.lcssa = phi double [ %58, %.lr.ph60 ], [ %.lcssa87.unr, %.lr.ph56.prol.loopexit ], [ %87, %._crit_edge57.loopexit ]
  %88 = getelementptr inbounds double, double* %4, i64 %indvars.iv1959
  store double %.2.lcssa, double* %88, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1959, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond, label %.preheader, label %.lr.ph60

.lr.ph50:                                         ; preds = %.lr.ph50.preheader, %._crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge ], [ 0, %.lr.ph50.preheader ]
  %indvars.iv.next1649.in = phi i64 [ %indvars.iv.next1649, %._crit_edge ], [ 2000, %.lr.ph50.preheader ]
  %89 = add nsw i64 %indvar, -1
  %indvars.iv.next1649 = add nsw i64 %indvars.iv.next1649.in, -1
  %90 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next1649
  %91 = load double, double* %90, align 8
  %92 = icmp slt i64 %indvars.iv.next1649.in, 2000
  br i1 %92, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph50
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %.346.prol = phi double [ %98, %.lr.ph.prol ], [ %91, %.lr.ph.prol.preheader ]
  %indvars.iv1345.prol = phi i64 [ %indvars.iv.next14.prol, %.lr.ph.prol ], [ %indvars.iv.next1649.in, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next1649, i64 %indvars.iv1345.prol
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %3, i64 %indvars.iv1345.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.346.prol, %97
  %indvars.iv.next14.prol = add nsw i64 %indvars.iv1345.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !5

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %.346.unr = phi double [ %91, %.lr.ph.preheader ], [ %98, %.lr.ph.prol.loopexit.loopexit ]
  %indvars.iv1345.unr = phi i64 [ %indvars.iv.next1649.in, %.lr.ph.preheader ], [ %indvars.iv.next14.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %98, %.lr.ph.prol.loopexit.loopexit ]
  %99 = icmp ult i64 %89, 3
  br i1 %99, label %._crit_edge, label %.lr.ph.preheader124

.lr.ph.preheader124:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader124, %.lr.ph
  %.346 = phi double [ %121, %.lr.ph ], [ %.346.unr, %.lr.ph.preheader124 ]
  %indvars.iv1345 = phi i64 [ %indvars.iv.next14.3, %.lr.ph ], [ %indvars.iv1345.unr, %.lr.ph.preheader124 ]
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next1649, i64 %indvars.iv1345
  %101 = bitcast double* %100 to <2 x double>*
  %102 = getelementptr inbounds double, double* %3, i64 %indvars.iv1345
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %101, align 8
  %105 = load <2 x double>, <2 x double>* %103, align 8
  %106 = fmul <2 x double> %104, %105
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %109 = fsub double %.346, %107
  %110 = fsub double %109, %108
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1345, 2
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next1649, i64 %indvars.iv.next14.1
  %112 = bitcast double* %111 to <2 x double>*
  %113 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next14.1
  %114 = bitcast double* %113 to <2 x double>*
  %115 = load <2 x double>, <2 x double>* %112, align 8
  %116 = load <2 x double>, <2 x double>* %114, align 8
  %117 = fmul <2 x double> %115, %116
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  %120 = fsub double %110, %118
  %121 = fsub double %120, %119
  %indvars.iv.next14.3 = add nsw i64 %indvars.iv1345, 4
  %exitcond90.3 = icmp eq i64 %indvars.iv.next14.3, 2000
  br i1 %exitcond90.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph50
  %.3.lcssa = phi double [ %91, %.lr.ph50 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %121, %._crit_edge.loopexit ]
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next1649, i64 %indvars.iv.next1649
  %123 = load double, double* %122, align 8
  %124 = fdiv double %.3.lcssa, %123
  %sunkaddr115 = shl i64 %indvars.iv.next1649.in, 3
  %sunkaddr116 = add i64 %sunkaddr, %sunkaddr115
  %sunkaddr117 = add i64 %sunkaddr116, -8
  %sunkaddr118 = inttoptr i64 %sunkaddr117 to double*
  store double %124, double* %sunkaddr118, align 8
  %125 = icmp sgt i64 %indvars.iv.next1649.in, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %125, label %.lr.ph50, label %._crit_edge51.loopexit

._crit_edge51.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %5, %.preheader10, %.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %12
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %12 ], [ 0, %.lr.ph.preheader ]
  %7 = trunc i64 %indvars.iv1 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %.lr.ph
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %12

; <label>:12:                                     ; preds = %10, %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %12
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
