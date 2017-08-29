; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %9
  %11 = icmp sgt i32 %2, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader10.us.preheader, label %.preheader7

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %wide.trip.count59 = zext i32 %2 to i64
  %wide.trip.count63 = zext i32 %0 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %.preheader10.us.preheader, %._crit_edge27.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge27.us ], [ 0, %.preheader10.us.preheader ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge ]
  %14 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %indvars.iv57
  store double %19, double* %20, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge27.us, label %._crit_edge

._crit_edge27.us:                                 ; preds = %._crit_edge
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %.preheader9.loopexit, label %.preheader10.us

.preheader9.loopexit:                             ; preds = %._crit_edge27.us
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %9
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %22 = icmp sgt i32 %1, 0
  %23 = mul nsw i32 %1, 5
  %24 = sitofp i32 %23 to double
  br i1 %22, label %.preheader8.us.preheader, label %.preheader5

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %wide.trip.count50 = zext i32 %1 to i64
  %wide.trip.count54 = zext i32 %2 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge22.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge22.us ], [ 0, %.preheader8.us.preheader ]
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66, %.preheader8.us
  %indvars.iv48 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next49, %._crit_edge66 ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %25 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %26 = add nuw nsw i64 %25, 2
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %24
  %31 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv52, i64 %indvars.iv48
  store double %30, double* %31, align 8
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %._crit_edge22.us, label %._crit_edge66

._crit_edge22.us:                                 ; preds = %._crit_edge66
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %.preheader7.loopexit, label %.preheader8.us

.preheader7.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader10.lr.ph, %.preheader9
  %32 = icmp sgt i32 %1, 0
  br i1 %32, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %33 = icmp sgt i32 %4, 0
  %34 = mul nsw i32 %3, 5
  %35 = sitofp i32 %34 to double
  br i1 %33, label %.preheader6.us.preheader, label %._crit_edge14

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count41 = zext i32 %4 to i64
  %wide.trip.count45 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge17.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge17.us ], [ 0, %.preheader6.us.preheader ]
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge67 ]
  %36 = add nuw nsw i64 %indvars.iv39, 3
  %37 = mul nuw nsw i64 %36, %indvars.iv43
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %3
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %35
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv43, i64 %indvars.iv39
  store double %41, double* %42, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge17.us, label %._crit_edge67

._crit_edge17.us:                                 ; preds = %._crit_edge67
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader5.loopexit, label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader8.lr.ph, %.preheader7
  %43 = icmp sgt i32 %4, 0
  br i1 %43, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.preheader5
  %44 = icmp sgt i32 %3, 0
  %45 = mul nsw i32 %2, 5
  %46 = sitofp i32 %45 to double
  br i1 %44, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count36 = zext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge68 ]
  %47 = add nuw nsw i64 %indvars.iv, 2
  %48 = mul nuw nsw i64 %47, %indvars.iv34
  %49 = add nuw nsw i64 %48, 2
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, %2
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %46
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv34, i64 %indvars.iv
  store double %53, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge68

._crit_edge.us:                                   ; preds = %._crit_edge68
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader6.lr.ph, %.preheader.lr.ph, %.preheader5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %12
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader10.us.preheader, label %.preheader.lr.ph

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %wide.trip.count112 = zext i32 %0 to i64
  %wide.trip.count102 = zext i32 %2 to i64
  %wide.trip.count106 = zext i32 %1 to i64
  %xtraiter120 = and i64 %wide.trip.count102, 1
  %lcmp.mod121 = icmp eq i64 %xtraiter120, 0
  %20 = icmp eq i32 %2, 1
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge43.us, %.preheader10.us.preheader
  %indvars.iv110 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next111, %._crit_edge43.us ]
  br i1 %15, label %.lr.ph39.us.us.preheader, label %._crit_edge43.us.loopexit55

.lr.ph39.us.us.preheader:                         ; preds = %.preheader10.us
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv110, i64 0
  br label %.lr.ph39.us.us

._crit_edge43.us.loopexit55:                      ; preds = %.preheader10.us
  %scevgep98 = getelementptr [900 x double], [900 x double]* %5, i64 %indvars.iv110, i64 0
  %scevgep9899 = bitcast double* %scevgep98 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep9899, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge43.us

._crit_edge43.us.loopexit:                        ; preds = %._crit_edge40.us.us
  br label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %._crit_edge43.us.loopexit, %._crit_edge43.us.loopexit55
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next111, %wide.trip.count112
  br i1 %exitcond113, label %.preheader9.loopexit, label %.preheader10.us

.lr.ph39.us.us:                                   ; preds = %.lr.ph39.us.us.preheader, %._crit_edge40.us.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge40.us.us ], [ 0, %.lr.ph39.us.us.preheader ]
  %22 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv110, i64 %indvars.iv104
  store double 0.000000e+00, double* %22, align 8
  br i1 %lcmp.mod121, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph39.us.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %23 = load double, double* %21, align 8
  %24 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv104
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %26, 0.000000e+00
  store double %27, double* %22, align 8
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph39.us.us, %._crit_edge.prol
  %indvars.iv100.unr.ph = phi i64 [ 1, %._crit_edge.prol ], [ 0, %.lr.ph39.us.us ]
  %.unr122.ph = phi double [ %27, %._crit_edge.prol ], [ 0.000000e+00, %.lr.ph39.us.us ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  br i1 %20, label %._crit_edge40.us.us, label %.lr.ph39.us.us.new

.lr.ph39.us.us.new:                               ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge40.us.us.unr-lcssa:                    ; preds = %._crit_edge
  br label %._crit_edge40.us.us

._crit_edge40.us.us:                              ; preds = %._crit_edge.prol.loopexit, %._crit_edge40.us.us.unr-lcssa
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, %wide.trip.count106
  br i1 %exitcond107, label %._crit_edge43.us.loopexit, label %.lr.ph39.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph39.us.us.new
  %indvars.iv100 = phi i64 [ %indvars.iv100.unr.ph, %.lr.ph39.us.us.new ], [ %indvars.iv.next101.1, %._crit_edge ]
  %28 = phi double [ %.unr122.ph, %.lr.ph39.us.us.new ], [ %40, %._crit_edge ]
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv110, i64 %indvars.iv100
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv100, i64 %indvars.iv104
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %22, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv110, i64 %indvars.iv.next101
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next101, i64 %indvars.iv104
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %34, %39
  store double %40, double* %22, align 8
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, %wide.trip.count102
  br i1 %exitcond103.1, label %._crit_edge40.us.us.unr-lcssa, label %._crit_edge

.preheader9.loopexit:                             ; preds = %._crit_edge43.us
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %12
  %41 = icmp sgt i32 %1, 0
  br i1 %41, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %42 = icmp sgt i32 %3, 0
  %43 = icmp sgt i32 %4, 0
  br i1 %42, label %.preheader8.us.preheader, label %.preheader7

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %44 = add i32 %3, -1
  %45 = zext i32 %44 to i64
  %46 = shl nuw nsw i64 %45, 3
  %47 = add nuw nsw i64 %46, 8
  %wide.trip.count91 = zext i32 %1 to i64
  %wide.trip.count81 = zext i32 %4 to i64
  %wide.trip.count85 = zext i32 %3 to i64
  %xtraiter117 = and i64 %wide.trip.count81, 1
  %lcmp.mod118 = icmp eq i64 %xtraiter117, 0
  %48 = icmp eq i32 %4, 1
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge29.us, %.preheader8.us.preheader
  %indvars.iv89 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next90, %._crit_edge29.us ]
  br i1 %43, label %.lr.ph25.us.us.preheader, label %._crit_edge29.us.loopexit53

.lr.ph25.us.us.preheader:                         ; preds = %.preheader8.us
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv89, i64 0
  br label %.lr.ph25.us.us

._crit_edge29.us.loopexit53:                      ; preds = %.preheader8.us
  %scevgep77 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvars.iv89, i64 0
  %scevgep7778 = bitcast double* %scevgep77 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7778, i8 0, i64 %47, i32 8, i1 false)
  br label %._crit_edge29.us

._crit_edge29.us.loopexit:                        ; preds = %._crit_edge26.us.us
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit, %._crit_edge29.us.loopexit53
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %.preheader7.loopexit, label %.preheader8.us

.lr.ph25.us.us:                                   ; preds = %.lr.ph25.us.us.preheader, %._crit_edge26.us.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %._crit_edge26.us.us ], [ 0, %.lr.ph25.us.us.preheader ]
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv89, i64 %indvars.iv83
  store double 0.000000e+00, double* %50, align 8
  br i1 %lcmp.mod118, label %._crit_edge115.prol.loopexit.unr-lcssa, label %._crit_edge115.prol.preheader

._crit_edge115.prol.preheader:                    ; preds = %.lr.ph25.us.us
  br label %._crit_edge115.prol

._crit_edge115.prol:                              ; preds = %._crit_edge115.prol.preheader
  %51 = load double, double* %49, align 8
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv83
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %54, 0.000000e+00
  store double %55, double* %50, align 8
  br label %._crit_edge115.prol.loopexit.unr-lcssa

._crit_edge115.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph25.us.us, %._crit_edge115.prol
  %indvars.iv79.unr.ph = phi i64 [ 1, %._crit_edge115.prol ], [ 0, %.lr.ph25.us.us ]
  %.unr119.ph = phi double [ %55, %._crit_edge115.prol ], [ 0.000000e+00, %.lr.ph25.us.us ]
  br label %._crit_edge115.prol.loopexit

._crit_edge115.prol.loopexit:                     ; preds = %._crit_edge115.prol.loopexit.unr-lcssa
  br i1 %48, label %._crit_edge26.us.us, label %.lr.ph25.us.us.new

.lr.ph25.us.us.new:                               ; preds = %._crit_edge115.prol.loopexit
  br label %._crit_edge115

._crit_edge26.us.us.unr-lcssa:                    ; preds = %._crit_edge115
  br label %._crit_edge26.us.us

._crit_edge26.us.us:                              ; preds = %._crit_edge115.prol.loopexit, %._crit_edge26.us.us.unr-lcssa
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next84, %wide.trip.count85
  br i1 %exitcond86, label %._crit_edge29.us.loopexit, label %.lr.ph25.us.us

._crit_edge115:                                   ; preds = %._crit_edge115, %.lr.ph25.us.us.new
  %indvars.iv79 = phi i64 [ %indvars.iv79.unr.ph, %.lr.ph25.us.us.new ], [ %indvars.iv.next80.1, %._crit_edge115 ]
  %56 = phi double [ %.unr119.ph, %.lr.ph25.us.us.new ], [ %68, %._crit_edge115 ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv89, i64 %indvars.iv79
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv79, i64 %indvars.iv83
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %50, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv89, i64 %indvars.iv.next80
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next80, i64 %indvars.iv83
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %50, align 8
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  %exitcond82.1 = icmp eq i64 %indvars.iv.next80.1, %wide.trip.count81
  br i1 %exitcond82.1, label %._crit_edge26.us.us.unr-lcssa, label %._crit_edge115

.preheader7.loopexit:                             ; preds = %._crit_edge29.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader8.lr.ph, %.preheader9
  br i1 %13, label %.preheader.lr.ph, label %._crit_edge16

.preheader.lr.ph:                                 ; preds = %.preheader10.lr.ph, %.preheader7
  %69 = icmp sgt i32 %3, 0
  %70 = icmp sgt i32 %1, 0
  br i1 %69, label %.preheader.us.preheader, label %._crit_edge16

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %71 = add i32 %3, -1
  %72 = zext i32 %71 to i64
  %73 = shl nuw nsw i64 %72, 3
  %74 = add nuw nsw i64 %73, 8
  %wide.trip.count70 = zext i32 %0 to i64
  %wide.trip.count60 = zext i32 %1 to i64
  %wide.trip.count64 = zext i32 %3 to i64
  %xtraiter = and i64 %wide.trip.count60, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %75 = icmp eq i32 %1, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge14.us, %.preheader.us.preheader
  %indvars.iv68 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next69, %._crit_edge14.us ]
  br i1 %70, label %.lr.ph.us.us.preheader, label %._crit_edge14.us.loopexit51

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %76 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv68, i64 0
  br label %.lr.ph.us.us

._crit_edge14.us.loopexit51:                      ; preds = %.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvars.iv68, i64 0
  %scevgep57 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep57, i8 0, i64 %74, i32 8, i1 false)
  br label %._crit_edge14.us

._crit_edge14.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %._crit_edge14.us.loopexit51
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %._crit_edge16.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %77 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv68, i64 %indvars.iv62
  store double 0.000000e+00, double* %77, align 8
  br i1 %lcmp.mod, label %._crit_edge116.prol.loopexit.unr-lcssa, label %._crit_edge116.prol.preheader

._crit_edge116.prol.preheader:                    ; preds = %.lr.ph.us.us
  br label %._crit_edge116.prol

._crit_edge116.prol:                              ; preds = %._crit_edge116.prol.preheader
  %78 = load double, double* %76, align 8
  %79 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv62
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %81, 0.000000e+00
  store double %82, double* %77, align 8
  br label %._crit_edge116.prol.loopexit.unr-lcssa

._crit_edge116.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph.us.us, %._crit_edge116.prol
  %indvars.iv58.unr.ph = phi i64 [ 1, %._crit_edge116.prol ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %82, %._crit_edge116.prol ], [ 0.000000e+00, %.lr.ph.us.us ]
  br label %._crit_edge116.prol.loopexit

._crit_edge116.prol.loopexit:                     ; preds = %._crit_edge116.prol.loopexit.unr-lcssa
  br i1 %75, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge116.prol.loopexit
  br label %._crit_edge116

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge116
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge116.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, %wide.trip.count64
  br i1 %exitcond65, label %._crit_edge14.us.loopexit, label %.lr.ph.us.us

._crit_edge116:                                   ; preds = %._crit_edge116, %.lr.ph.us.us.new
  %indvars.iv58 = phi i64 [ %indvars.iv58.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next59.1, %._crit_edge116 ]
  %83 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %95, %._crit_edge116 ]
  %84 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv58
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv58, i64 %indvars.iv62
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %83, %88
  store double %89, double* %77, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %90 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv.next59
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next59, i64 %indvars.iv62
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = fadd double %89, %94
  store double %95, double* %77, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next59.1, %wide.trip.count60
  br i1 %exitcond61.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge116

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader.lr.ph, %.preheader7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
