; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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

._crit_edge:                                      ; preds = %2
  br label %22

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge1

._crit_edge1:                                     ; preds = %18
  br label %22

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %22

; <label>:22:                                     ; preds = %._crit_edge1, %._crit_edge, %21
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
  br i1 %10, label %.preheader10.lr.ph, label %..preheader9_crit_edge

..preheader9_crit_edge:                           ; preds = %9
  br label %.preheader9

.preheader10.lr.ph:                               ; preds = %9
  %11 = icmp sgt i32 %2, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader10.us.preheader, label %.preheader10.lr.ph..preheader7_crit_edge

.preheader10.lr.ph..preheader7_crit_edge:         ; preds = %.preheader10.lr.ph
  br label %.preheader7

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %wide.trip.count59 = zext i32 %2 to i64
  %wide.trip.count63 = zext i32 %0 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge27.us..preheader10.us_crit_edge, %.preheader10.us.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge27.us..preheader10.us_crit_edge ], [ 0, %.preheader10.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge ]
  %15 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  %16 = add nuw nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %0
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %13
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv61, i64 %indvars.iv57
  store double %20, double* %21, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge27.us, label %._crit_edge

._crit_edge:                                      ; preds = %14
  br label %14

._crit_edge27.us:                                 ; preds = %14
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %.preheader9.loopexit, label %._crit_edge27.us..preheader10.us_crit_edge

._crit_edge27.us..preheader10.us_crit_edge:       ; preds = %._crit_edge27.us
  br label %.preheader10.us

.preheader9.loopexit:                             ; preds = %._crit_edge27.us
  br label %.preheader9

.preheader9:                                      ; preds = %..preheader9_crit_edge, %.preheader9.loopexit
  %22 = icmp sgt i32 %2, 0
  br i1 %22, label %.preheader8.lr.ph, label %.preheader9..preheader7_crit_edge

.preheader9..preheader7_crit_edge:                ; preds = %.preheader9
  br label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %23 = icmp sgt i32 %1, 0
  %24 = mul nsw i32 %1, 5
  %25 = sitofp i32 %24 to double
  br i1 %23, label %.preheader8.us.preheader, label %.preheader8.lr.ph..preheader5_crit_edge

.preheader8.lr.ph..preheader5_crit_edge:          ; preds = %.preheader8.lr.ph
  br label %.preheader5

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %wide.trip.count50 = zext i32 %1 to i64
  %wide.trip.count54 = zext i32 %2 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge22.us..preheader8.us_crit_edge, %.preheader8.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge22.us..preheader8.us_crit_edge ], [ 0, %.preheader8.us.preheader ]
  br label %26

; <label>:26:                                     ; preds = %._crit_edge66, %.preheader8.us
  %indvars.iv48 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next49, %._crit_edge66 ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %27 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %28 = add nuw nsw i64 %27, 2
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %1
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %25
  %33 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv52, i64 %indvars.iv48
  store double %32, double* %33, align 8
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %._crit_edge22.us, label %._crit_edge66

._crit_edge66:                                    ; preds = %26
  br label %26

._crit_edge22.us:                                 ; preds = %26
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %.preheader7.loopexit, label %._crit_edge22.us..preheader8.us_crit_edge

._crit_edge22.us..preheader8.us_crit_edge:        ; preds = %._crit_edge22.us
  br label %.preheader8.us

.preheader7.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader9..preheader7_crit_edge, %.preheader10.lr.ph..preheader7_crit_edge, %.preheader7.loopexit
  %34 = icmp sgt i32 %1, 0
  br i1 %34, label %.preheader6.lr.ph, label %.preheader7..preheader5_crit_edge

.preheader7..preheader5_crit_edge:                ; preds = %.preheader7
  br label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %35 = icmp sgt i32 %4, 0
  %36 = mul nsw i32 %3, 5
  %37 = sitofp i32 %36 to double
  br i1 %35, label %.preheader6.us.preheader, label %.preheader6.lr.ph.._crit_edge14_crit_edge

.preheader6.lr.ph.._crit_edge14_crit_edge:        ; preds = %.preheader6.lr.ph
  br label %._crit_edge14

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count41 = zext i32 %4 to i64
  %wide.trip.count45 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge17.us..preheader6.us_crit_edge, %.preheader6.us.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge17.us..preheader6.us_crit_edge ], [ 0, %.preheader6.us.preheader ]
  br label %38

; <label>:38:                                     ; preds = %._crit_edge67, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge67 ]
  %39 = add nuw nsw i64 %indvars.iv39, 3
  %40 = mul nuw nsw i64 %39, %indvars.iv43
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, %3
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %37
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv43, i64 %indvars.iv39
  store double %44, double* %45, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge17.us, label %._crit_edge67

._crit_edge67:                                    ; preds = %38
  br label %38

._crit_edge17.us:                                 ; preds = %38
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader5.loopexit, label %._crit_edge17.us..preheader6.us_crit_edge

._crit_edge17.us..preheader6.us_crit_edge:        ; preds = %._crit_edge17.us
  br label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader7..preheader5_crit_edge, %.preheader8.lr.ph..preheader5_crit_edge, %.preheader5.loopexit
  %46 = icmp sgt i32 %4, 0
  br i1 %46, label %.preheader.lr.ph, label %.preheader5.._crit_edge14_crit_edge

.preheader5.._crit_edge14_crit_edge:              ; preds = %.preheader5
  br label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.preheader5
  %47 = icmp sgt i32 %3, 0
  %48 = mul nsw i32 %2, 5
  %49 = sitofp i32 %48 to double
  br i1 %47, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge14_crit_edge

.preheader.lr.ph.._crit_edge14_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count36 = zext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %50

; <label>:50:                                     ; preds = %._crit_edge68, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge68 ]
  %51 = add nuw nsw i64 %indvars.iv, 2
  %52 = mul nuw nsw i64 %51, %indvars.iv34
  %53 = add nuw nsw i64 %52, 2
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, %2
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, %49
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv34, i64 %indvars.iv
  store double %57, double* %58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge68

._crit_edge68:                                    ; preds = %50
  br label %50

._crit_edge.us:                                   ; preds = %50
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %._crit_edge14.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.preheader.lr.ph.._crit_edge14_crit_edge, %.preheader5.._crit_edge14_crit_edge, %.preheader6.lr.ph.._crit_edge14_crit_edge, %._crit_edge14.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader10.lr.ph, label %..preheader9_crit_edge

..preheader9_crit_edge:                           ; preds = %12
  br label %.preheader9

.preheader10.lr.ph:                               ; preds = %12
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader10.us.preheader, label %.preheader10.lr.ph..preheader.lr.ph_crit_edge

.preheader10.lr.ph..preheader.lr.ph_crit_edge:    ; preds = %.preheader10.lr.ph
  br label %.preheader.lr.ph

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %wide.trip.count115 = zext i32 %0 to i64
  %xtraiter105 = and i32 %2, 1
  %lcmp.mod106 = icmp eq i32 %xtraiter105, 0
  %20 = icmp eq i32 %2, 1
  %wide.trip.count109 = zext i32 %1 to i64
  %wide.trip.count101.1 = zext i32 %2 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge43.us..preheader10.us_crit_edge, %.preheader10.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next114, %._crit_edge43.us..preheader10.us_crit_edge ]
  br i1 %15, label %.lr.ph39.us.us.preheader, label %._crit_edge43.us.loopexit55

.lr.ph39.us.us.preheader:                         ; preds = %.preheader10.us
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv113, i64 0
  br label %.lr.ph39.us.us

._crit_edge43.us.loopexit55:                      ; preds = %.preheader10.us
  %scevgep97 = getelementptr [900 x double], [900 x double]* %5, i64 %indvars.iv113, i64 0
  %scevgep9798 = bitcast double* %scevgep97 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep9798, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge43.us

._crit_edge43.us.loopexit:                        ; preds = %._crit_edge40.us.us
  br label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %._crit_edge43.us.loopexit, %._crit_edge43.us.loopexit55
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, %wide.trip.count115
  br i1 %exitcond116, label %.preheader9.loopexit, label %._crit_edge43.us..preheader10.us_crit_edge

._crit_edge43.us..preheader10.us_crit_edge:       ; preds = %._crit_edge43.us
  br label %.preheader10.us

.lr.ph39.us.us:                                   ; preds = %._crit_edge40.us.us..lr.ph39.us.us_crit_edge, %.lr.ph39.us.us.preheader
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge40.us.us..lr.ph39.us.us_crit_edge ], [ 0, %.lr.ph39.us.us.preheader ]
  %22 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv113, i64 %indvars.iv107
  store double 0.000000e+00, double* %22, align 8
  br i1 %lcmp.mod106, label %.lr.ph39.us.us..prol.loopexit104_crit_edge, label %.prol.preheader103

.lr.ph39.us.us..prol.loopexit104_crit_edge:       ; preds = %.lr.ph39.us.us
  br label %.prol.loopexit104

.prol.preheader103:                               ; preds = %.lr.ph39.us.us
  %23 = load double, double* %21, align 8
  %24 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv107
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %22, align 8
  %28 = fadd double %27, %26
  store double %28, double* %22, align 8
  br label %.prol.loopexit104

.prol.loopexit104:                                ; preds = %.lr.ph39.us.us..prol.loopexit104_crit_edge, %.prol.preheader103
  %indvars.iv99.unr.ph = phi i64 [ 1, %.prol.preheader103 ], [ 0, %.lr.ph39.us.us..prol.loopexit104_crit_edge ]
  br i1 %20, label %.prol.loopexit104.._crit_edge40.us.us_crit_edge, label %.lr.ph39.us.us.new.preheader

.prol.loopexit104.._crit_edge40.us.us_crit_edge:  ; preds = %.prol.loopexit104
  br label %._crit_edge40.us.us

.lr.ph39.us.us.new.preheader:                     ; preds = %.prol.loopexit104
  br label %.lr.ph39.us.us.new

._crit_edge40.us.us.loopexit:                     ; preds = %.lr.ph39.us.us.new
  br label %._crit_edge40.us.us

._crit_edge40.us.us:                              ; preds = %.prol.loopexit104.._crit_edge40.us.us_crit_edge, %._crit_edge40.us.us.loopexit
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, %wide.trip.count109
  br i1 %exitcond110, label %._crit_edge43.us.loopexit, label %._crit_edge40.us.us..lr.ph39.us.us_crit_edge

._crit_edge40.us.us..lr.ph39.us.us_crit_edge:     ; preds = %._crit_edge40.us.us
  br label %.lr.ph39.us.us

.lr.ph39.us.us.new:                               ; preds = %.lr.ph39.us.us.new..lr.ph39.us.us.new_crit_edge, %.lr.ph39.us.us.new.preheader
  %indvars.iv99 = phi i64 [ %indvars.iv.next100.1, %.lr.ph39.us.us.new..lr.ph39.us.us.new_crit_edge ], [ %indvars.iv99.unr.ph, %.lr.ph39.us.us.new.preheader ]
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv113, i64 %indvars.iv99
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv99, i64 %indvars.iv107
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %22, align 8
  %35 = fadd double %34, %33
  store double %35, double* %22, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv113, i64 %indvars.iv.next100
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next100, i64 %indvars.iv107
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = load double, double* %22, align 8
  %42 = fadd double %41, %40
  store double %42, double* %22, align 8
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, %wide.trip.count101.1
  br i1 %exitcond102.1, label %._crit_edge40.us.us.loopexit, label %.lr.ph39.us.us.new..lr.ph39.us.us.new_crit_edge

.lr.ph39.us.us.new..lr.ph39.us.us.new_crit_edge:  ; preds = %.lr.ph39.us.us.new
  br label %.lr.ph39.us.us.new

.preheader9.loopexit:                             ; preds = %._crit_edge43.us
  br label %.preheader9

.preheader9:                                      ; preds = %..preheader9_crit_edge, %.preheader9.loopexit
  %43 = icmp sgt i32 %1, 0
  br i1 %43, label %.preheader8.lr.ph, label %.preheader9..preheader7_crit_edge

.preheader9..preheader7_crit_edge:                ; preds = %.preheader9
  br label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %44 = icmp sgt i32 %3, 0
  %45 = icmp sgt i32 %4, 0
  br i1 %44, label %.preheader8.us.preheader, label %.preheader8.lr.ph..preheader7_crit_edge

.preheader8.lr.ph..preheader7_crit_edge:          ; preds = %.preheader8.lr.ph
  br label %.preheader7

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %46 = add i32 %3, -1
  %47 = zext i32 %46 to i64
  %48 = shl nuw nsw i64 %47, 3
  %49 = add nuw nsw i64 %48, 8
  %wide.trip.count90 = zext i32 %1 to i64
  %xtraiter80 = and i32 %4, 1
  %lcmp.mod81 = icmp eq i32 %xtraiter80, 0
  %50 = icmp eq i32 %4, 1
  %wide.trip.count84 = zext i32 %3 to i64
  %wide.trip.count76.1 = zext i32 %4 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge29.us..preheader8.us_crit_edge, %.preheader8.us.preheader
  %indvars.iv88 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next89, %._crit_edge29.us..preheader8.us_crit_edge ]
  br i1 %45, label %.lr.ph25.us.us.preheader, label %._crit_edge29.us.loopexit53

.lr.ph25.us.us.preheader:                         ; preds = %.preheader8.us
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv88, i64 0
  br label %.lr.ph25.us.us

._crit_edge29.us.loopexit53:                      ; preds = %.preheader8.us
  %scevgep72 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvars.iv88, i64 0
  %scevgep7273 = bitcast double* %scevgep72 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep7273, i8 0, i64 %49, i32 8, i1 false)
  br label %._crit_edge29.us

._crit_edge29.us.loopexit:                        ; preds = %._crit_edge26.us.us
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit, %._crit_edge29.us.loopexit53
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, %wide.trip.count90
  br i1 %exitcond91, label %.preheader7.loopexit, label %._crit_edge29.us..preheader8.us_crit_edge

._crit_edge29.us..preheader8.us_crit_edge:        ; preds = %._crit_edge29.us
  br label %.preheader8.us

.lr.ph25.us.us:                                   ; preds = %._crit_edge26.us.us..lr.ph25.us.us_crit_edge, %.lr.ph25.us.us.preheader
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge26.us.us..lr.ph25.us.us_crit_edge ], [ 0, %.lr.ph25.us.us.preheader ]
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv88, i64 %indvars.iv82
  store double 0.000000e+00, double* %52, align 8
  br i1 %lcmp.mod81, label %.lr.ph25.us.us..prol.loopexit79_crit_edge, label %.prol.preheader78

.lr.ph25.us.us..prol.loopexit79_crit_edge:        ; preds = %.lr.ph25.us.us
  br label %.prol.loopexit79

.prol.preheader78:                                ; preds = %.lr.ph25.us.us
  %53 = load double, double* %51, align 8
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv82
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = load double, double* %52, align 8
  %58 = fadd double %57, %56
  store double %58, double* %52, align 8
  br label %.prol.loopexit79

.prol.loopexit79:                                 ; preds = %.lr.ph25.us.us..prol.loopexit79_crit_edge, %.prol.preheader78
  %indvars.iv74.unr.ph = phi i64 [ 1, %.prol.preheader78 ], [ 0, %.lr.ph25.us.us..prol.loopexit79_crit_edge ]
  br i1 %50, label %.prol.loopexit79.._crit_edge26.us.us_crit_edge, label %.lr.ph25.us.us.new.preheader

.prol.loopexit79.._crit_edge26.us.us_crit_edge:   ; preds = %.prol.loopexit79
  br label %._crit_edge26.us.us

.lr.ph25.us.us.new.preheader:                     ; preds = %.prol.loopexit79
  br label %.lr.ph25.us.us.new

._crit_edge26.us.us.loopexit:                     ; preds = %.lr.ph25.us.us.new
  br label %._crit_edge26.us.us

._crit_edge26.us.us:                              ; preds = %.prol.loopexit79.._crit_edge26.us.us_crit_edge, %._crit_edge26.us.us.loopexit
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %._crit_edge29.us.loopexit, label %._crit_edge26.us.us..lr.ph25.us.us_crit_edge

._crit_edge26.us.us..lr.ph25.us.us_crit_edge:     ; preds = %._crit_edge26.us.us
  br label %.lr.ph25.us.us

.lr.ph25.us.us.new:                               ; preds = %.lr.ph25.us.us.new..lr.ph25.us.us.new_crit_edge, %.lr.ph25.us.us.new.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv.next75.1, %.lr.ph25.us.us.new..lr.ph25.us.us.new_crit_edge ], [ %indvars.iv74.unr.ph, %.lr.ph25.us.us.new.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv88, i64 %indvars.iv74
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv74, i64 %indvars.iv82
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = load double, double* %52, align 8
  %65 = fadd double %64, %63
  store double %65, double* %52, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv88, i64 %indvars.iv.next75
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next75, i64 %indvars.iv82
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = load double, double* %52, align 8
  %72 = fadd double %71, %70
  store double %72, double* %52, align 8
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74, 2
  %exitcond77.1 = icmp eq i64 %indvars.iv.next75.1, %wide.trip.count76.1
  br i1 %exitcond77.1, label %._crit_edge26.us.us.loopexit, label %.lr.ph25.us.us.new..lr.ph25.us.us.new_crit_edge

.lr.ph25.us.us.new..lr.ph25.us.us.new_crit_edge:  ; preds = %.lr.ph25.us.us.new
  br label %.lr.ph25.us.us.new

.preheader7.loopexit:                             ; preds = %._crit_edge29.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader8.lr.ph..preheader7_crit_edge, %.preheader9..preheader7_crit_edge, %.preheader7.loopexit
  %73 = icmp sgt i32 %0, 0
  br i1 %73, label %.preheader7..preheader.lr.ph_crit_edge, label %.preheader7.._crit_edge16_crit_edge

.preheader7.._crit_edge16_crit_edge:              ; preds = %.preheader7
  br label %._crit_edge16

.preheader7..preheader.lr.ph_crit_edge:           ; preds = %.preheader7
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader7..preheader.lr.ph_crit_edge, %.preheader10.lr.ph..preheader.lr.ph_crit_edge
  %74 = icmp sgt i32 %3, 0
  %75 = icmp sgt i32 %1, 0
  br i1 %74, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge16_crit_edge

.preheader.lr.ph.._crit_edge16_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge16

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %76 = add i32 %3, -1
  %77 = zext i32 %76 to i64
  %78 = shl nuw nsw i64 %77, 3
  %79 = add nuw nsw i64 %78, 8
  %wide.trip.count65 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %80 = icmp eq i32 %1, 1
  %wide.trip.count60 = zext i32 %3 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge14.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv63 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next64, %._crit_edge14.us..preheader.us_crit_edge ]
  br i1 %75, label %.lr.ph.us.us.preheader, label %._crit_edge14.us.loopexit51

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %81 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv63, i64 0
  br label %.lr.ph.us.us

._crit_edge14.us.loopexit51:                      ; preds = %.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvars.iv63, i64 0
  %scevgep57 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep57, i8 0, i64 %79, i32 8, i1 false)
  br label %._crit_edge14.us

._crit_edge14.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %._crit_edge14.us.loopexit51
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond66, label %._crit_edge16.loopexit, label %._crit_edge14.us..preheader.us_crit_edge

._crit_edge14.us..preheader.us_crit_edge:         ; preds = %._crit_edge14.us
  br label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.lr.ph.us.us.preheader ]
  %82 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv63, i64 %indvars.iv58
  store double 0.000000e+00, double* %82, align 8
  br i1 %lcmp.mod, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %83 = load double, double* %81, align 8
  %84 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv58
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = load double, double* %82, align 8
  %88 = fadd double %87, %86
  store double %88, double* %82, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %80, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond, label %._crit_edge14.us.loopexit, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %89 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv58
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = load double, double* %82, align 8
  %95 = fadd double %94, %93
  store double %95, double* %82, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %96 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv58
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = load double, double* %82, align 8
  %102 = fadd double %101, %100
  store double %102, double* %82, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %.preheader.lr.ph.._crit_edge16_crit_edge, %.preheader7.._crit_edge16_crit_edge, %._crit_edge16.loopexit
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
  br i1 %or.cond, label %.preheader.us.preheader, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %3
  br label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us..preheader.us_crit_edge ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %12

; <label>:12:                                     ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge

._crit_edge:                                      ; preds = %12
  br label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %19

; <label>:19:                                     ; preds = %._crit_edge, %17
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge11:                                    ; preds = %19
  br label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.._crit_edge4_crit_edge, %._crit_edge4.loopexit
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
