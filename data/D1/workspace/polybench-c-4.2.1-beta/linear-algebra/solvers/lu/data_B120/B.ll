; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.lr.ph103:
  br label %.lr.ph95

.lr.ph95:                                         ; preds = %._crit_edge100.thread, %.lr.ph103
  %indvars.iv136 = phi i64 [ 0, %.lr.ph103 ], [ %indvars.iv.next137, %._crit_edge100.thread ]
  %1 = sub i64 1998, %indvars.iv136
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  br label %4

; <label>:4:                                      ; preds = %._crit_edge, %.lr.ph95
  %indvars.iv124 = phi i64 [ 0, %.lr.ph95 ], [ %indvars.iv.next125, %._crit_edge ]
  %5 = sub nsw i64 0, %indvars.iv124
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fadd double %9, 1.000000e+00
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv136, i64 %indvars.iv124
  store double %10, double* %11, align 8
  %exitcond128 = icmp eq i64 %indvars.iv124, %indvars.iv136
  br i1 %exitcond128, label %._crit_edge96, label %._crit_edge

._crit_edge:                                      ; preds = %4
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  br label %4

._crit_edge96:                                    ; preds = %4
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %12 = icmp slt i64 %indvars.iv.next137, 2000
  br i1 %12, label %._crit_edge100.thread, label %.lr.ph91.split.us.preheader

._crit_edge100.thread:                            ; preds = %._crit_edge96
  %13 = add nuw nsw i64 %3, 8
  %scevgep134 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv136, i64 %indvars.iv.next137
  %scevgep134135 = bitcast double* %scevgep134 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep134135, i8 0, i64 %13, i32 8, i1 false)
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv136, i64 %indvars.iv136
  store double 1.000000e+00, double* %14, align 8
  br label %.lr.ph95

.lr.ph91.split.us.preheader:                      ; preds = %._crit_edge96
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv136, i64 %indvars.iv136
  store double 1.000000e+00, double* %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge88.us

._crit_edge88.us:                                 ; preds = %._crit_edge88.us, %.lr.ph91.split.us.preheader
  %indvars.iv122 = phi i64 [ 0, %.lr.ph91.split.us.preheader ], [ %indvars.iv.next123.7, %._crit_edge88.us ]
  %17 = mul nuw nsw i64 %indvars.iv122, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123 = or i64 %indvars.iv122, 1
  %18 = mul nuw nsw i64 %indvars.iv.next123, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.1 = or i64 %indvars.iv122, 2
  %19 = mul nuw nsw i64 %indvars.iv.next123.1, 16000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.2 = or i64 %indvars.iv122, 3
  %20 = mul nuw nsw i64 %indvars.iv.next123.2, 16000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.3 = or i64 %indvars.iv122, 4
  %21 = mul nuw nsw i64 %indvars.iv.next123.3, 16000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.4 = or i64 %indvars.iv122, 5
  %22 = mul nuw nsw i64 %indvars.iv.next123.4, 16000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.5 = or i64 %indvars.iv122, 6
  %23 = mul nuw nsw i64 %indvars.iv.next123.5, 16000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.6 = or i64 %indvars.iv122, 7
  %24 = mul nuw nsw i64 %indvars.iv.next123.6, 16000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.7 = add nsw i64 %indvars.iv122, 8
  %exitcond6.7 = icmp eq i64 %indvars.iv.next123.7, 2000
  br i1 %exitcond6.7, label %.lr.ph73.us.us.preheader.preheader, label %._crit_edge88.us

.lr.ph73.us.us.preheader.preheader:               ; preds = %._crit_edge88.us
  %25 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.lr.ph73.us.us.preheader

.lr.ph73.us.us.preheader:                         ; preds = %._crit_edge77.us, %.lr.ph73.us.us.preheader.preheader
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %._crit_edge77.us ], [ 0, %.lr.ph73.us.us.preheader.preheader ]
  br label %.lr.ph73.us.us

._crit_edge77.us:                                 ; preds = %._crit_edge74.us.us
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next118, 2000
  br i1 %exitcond5, label %.lr.ph69.split.us.preheader, label %.lr.ph73.us.us.preheader

.lr.ph69.split.us.preheader:                      ; preds = %._crit_edge77.us
  %26 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.lr.ph69.split.us

.lr.ph73.us.us:                                   ; preds = %._crit_edge74.us.us, %.lr.ph73.us.us.preheader
  %indvars.iv115 = phi i64 [ 0, %.lr.ph73.us.us.preheader ], [ %indvars.iv.next116, %._crit_edge74.us.us ]
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv115, i64 %indvars.iv117
  br label %29

._crit_edge74.us.us:                              ; preds = %29
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond4, label %._crit_edge77.us, label %.lr.ph73.us.us

; <label>:29:                                     ; preds = %._crit_edge1, %.lr.ph73.us.us
  %indvars.iv112 = phi i64 [ 0, %.lr.ph73.us.us ], [ %indvars.iv.next113, %._crit_edge1 ]
  %30 = load double, double* %28, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv112, i64 %indvars.iv117
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv115, i64 %indvars.iv112
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8
  %exitcond114 = icmp eq i64 %indvars.iv112, 1999
  br i1 %exitcond114, label %._crit_edge74.us.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %29
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  br label %29

.lr.ph69.split.us:                                ; preds = %._crit_edge.us.1, %.lr.ph69.split.us.preheader
  %indvars.iv110 = phi i64 [ 0, %.lr.ph69.split.us.preheader ], [ %indvars.iv.next111.1, %._crit_edge.us.1 ]
  br label %37

; <label>:37:                                     ; preds = %._crit_edge2, %.lr.ph69.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph69.split.us ], [ %indvars.iv.next, %._crit_edge2 ]
  %38 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv110, i64 %indvars.iv
  %39 = bitcast double* %38 to i64*
  %40 = load i64, i64* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv
  %42 = bitcast double* %41 to i64*
  store i64 %40, i64* %42, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge2

._crit_edge2:                                     ; preds = %37
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %37

._crit_edge.us:                                   ; preds = %37
  %indvars.iv.next111 = or i64 %indvars.iv110, 1
  br label %43

._crit_edge70:                                    ; preds = %._crit_edge.us.1
  tail call void @free(i8* nonnull %16) #4
  ret void

; <label>:43:                                     ; preds = %._crit_edge2.1, %._crit_edge.us
  %indvars.iv.1 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next.1, %._crit_edge2.1 ]
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv.next111, i64 %indvars.iv.1
  %45 = bitcast double* %44 to i64*
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next111, i64 %indvars.iv.1
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.1, 1999
  br i1 %exitcond.1, label %._crit_edge.us.1, label %._crit_edge2.1

._crit_edge2.1:                                   ; preds = %43
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %43

._crit_edge.us.1:                                 ; preds = %43
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next111.1, 2000
  br i1 %exitcond3.1, label %._crit_edge70, label %.lr.ph69.split.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.lr.ph58.preheader:
  br label %.lr.ph58

.lr.ph58:                                         ; preds = %._crit_edge53..lr.ph58_crit_edge, %.lr.ph58.preheader
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %._crit_edge53..lr.ph58_crit_edge ], [ 0, %.lr.ph58.preheader ]
  %indvars.iv73 = phi i32 [ %indvars.iv.next74, %._crit_edge53..lr.ph58_crit_edge ], [ -1, %.lr.ph58.preheader ]
  %1 = icmp sgt i64 %indvars.iv81, 0
  br i1 %1, label %.lr.ph44.preheader, label %._crit_edge53

.lr.ph44.preheader:                               ; preds = %.lr.ph58
  br label %.lr.ph44

.lr.ph44:                                         ; preds = %.lr.ph44.preheader, %._crit_edge..lr.ph44_crit_edge
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge..lr.ph44_crit_edge ], [ 0, %.lr.ph44.preheader ]
  %indvars.iv66 = phi i32 [ %indvars.iv.next67, %._crit_edge..lr.ph44_crit_edge ], [ -1, %.lr.ph44.preheader ]
  %2 = icmp sgt i64 %indvars.iv68, 0
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv68
  %.pre = load double, double* %3, align 8
  br i1 %2, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph44
  %wide.trip.count = zext i32 %indvars.iv66 to i64
  br label %4

; <label>:4:                                      ; preds = %._crit_edge1, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge1 ]
  %5 = phi double [ %.pre, %.lr.ph ], [ %11, %._crit_edge1 ]
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv68
  %9 = load double, double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fsub double %5, %10
  store double %11, double* %3, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge1

._crit_edge1:                                     ; preds = %4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph44
  %12 = phi double [ %.pre, %.lr.ph44 ], [ %11, %._crit_edge.loopexit ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv68
  %14 = load double, double* %13, align 8
  %15 = fdiv double %12, %14
  store double %15, double* %3, align 8
  %indvars.iv.next69 = add nuw i64 %indvars.iv68, 1
  %16 = icmp slt i64 %indvars.iv.next69, %indvars.iv81
  br i1 %16, label %._crit_edge..lr.ph44_crit_edge, label %.lr.ph52.split.us.preheader

._crit_edge..lr.ph44_crit_edge:                   ; preds = %._crit_edge
  %indvars.iv.next67 = add nsw i32 %indvars.iv66, 1
  br label %.lr.ph44

.lr.ph52.split.us.preheader:                      ; preds = %._crit_edge
  %wide.trip.count75 = zext i32 %indvars.iv73 to i64
  br label %.lr.ph52.split.us

.lr.ph52.split.us:                                ; preds = %._crit_edge49.us, %.lr.ph52.split.us.preheader
  %indvars.iv79 = phi i64 [ %indvars.iv81, %.lr.ph52.split.us.preheader ], [ %indvars.iv.next80, %._crit_edge49.us ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv79
  %.pre65 = load double, double* %17, align 8
  br label %18

; <label>:18:                                     ; preds = %._crit_edge2, %.lr.ph52.split.us
  %indvars.iv71 = phi i64 [ 0, %.lr.ph52.split.us ], [ %indvars.iv.next72, %._crit_edge2 ]
  %19 = phi double [ %.pre65, %.lr.ph52.split.us ], [ %25, %._crit_edge2 ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv71
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv71, i64 %indvars.iv79
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %17, align 8
  %exitcond76 = icmp eq i64 %indvars.iv71, %wide.trip.count75
  br i1 %exitcond76, label %._crit_edge49.us, label %._crit_edge2

._crit_edge2:                                     ; preds = %18
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  br label %18

._crit_edge49.us:                                 ; preds = %18
  %indvars.iv.next80 = add nuw i64 %indvars.iv79, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next80, 2000
  br i1 %exitcond3, label %._crit_edge53.loopexit, label %.lr.ph52.split.us

._crit_edge53.loopexit:                           ; preds = %._crit_edge49.us
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.loopexit, %.lr.ph58
  %indvars.iv.next82 = add nuw i64 %indvars.iv81, 1
  %26 = icmp slt i64 %indvars.iv.next82, 2000
  br i1 %26, label %._crit_edge53..lr.ph58_crit_edge, label %._crit_edge59

._crit_edge53..lr.ph58_crit_edge:                 ; preds = %._crit_edge53
  %indvars.iv.next74 = add nsw i32 %indvars.iv73, 1
  br label %.lr.ph58

._crit_edge59:                                    ; preds = %._crit_edge53
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph14.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %._crit_edge.us, %.lr.ph14.split.us.preheader
  %indvars.iv17 = phi i64 [ 0, %.lr.ph14.split.us.preheader ], [ %indvars.iv.next18, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv17, 2000
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %.lr.ph14.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph14.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge1
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge1

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next18, 2000
  br i1 %exitcond2, label %._crit_edge15, label %.lr.ph14.split.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
