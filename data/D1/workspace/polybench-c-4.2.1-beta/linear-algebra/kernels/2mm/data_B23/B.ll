; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
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
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %22

; <label>:22:                                     ; preds = %._crit_edge1, %._crit_edge, %21
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader10.lr.ph, label %..preheader9_crit_edge

..preheader9_crit_edge:                           ; preds = %10
  br label %.preheader9

.preheader10.lr.ph:                               ; preds = %10
  %12 = icmp sgt i32 %2, 0
  %13 = sitofp i32 %0 to double
  br i1 %12, label %.preheader10.us.preheader, label %.preheader10.lr.ph..preheader7_crit_edge

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
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv57
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
  %24 = sitofp i32 %1 to double
  br i1 %23, label %.preheader8.us.preheader, label %.preheader8.lr.ph..preheader5_crit_edge

.preheader8.lr.ph..preheader5_crit_edge:          ; preds = %.preheader8.lr.ph
  br label %.preheader5

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %25 = icmp eq i32 %1, 1
  %wide.trip.count54 = zext i32 %2 to i64
  %wide.trip.count50.1 = zext i32 %1 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge22.us..preheader8.us_crit_edge, %.preheader8.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge22.us..preheader8.us_crit_edge ], [ 0, %.preheader8.us.preheader ]
  br i1 %lcmp.mod, label %.preheader8.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader8.us..prol.loopexit_crit_edge:          ; preds = %.preheader8.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader8.us
  %26 = trunc i64 %indvars.iv52 to i32
  %27 = srem i32 %26, %1
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, %24
  %30 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 0
  store double %29, double* %30, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader8.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv48.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader8.us..prol.loopexit_crit_edge ]
  br i1 %25, label %.prol.loopexit.._crit_edge22.us_crit_edge, label %.preheader8.us.new.preheader

.prol.loopexit.._crit_edge22.us_crit_edge:        ; preds = %.prol.loopexit
  br label %._crit_edge22.us

.preheader8.us.new.preheader:                     ; preds = %.prol.loopexit
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new..preheader8.us.new_crit_edge, %.preheader8.us.new.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.preheader8.us.new..preheader8.us.new_crit_edge ], [ %indvars.iv48.unr.ph, %.preheader8.us.new.preheader ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %31 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, %1
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %24
  %36 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv48
  store double %35, double* %36, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %37 = mul nuw nsw i64 %indvars.iv.next49.1, %indvars.iv52
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %1
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %24
  %42 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv.next49
  store double %41, double* %42, align 8
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50.1
  br i1 %exitcond51.1, label %._crit_edge22.us.loopexit, label %.preheader8.us.new..preheader8.us.new_crit_edge

.preheader8.us.new..preheader8.us.new_crit_edge:  ; preds = %.preheader8.us.new
  br label %.preheader8.us.new

._crit_edge22.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %.prol.loopexit.._crit_edge22.us_crit_edge, %._crit_edge22.us.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %.preheader7.loopexit, label %._crit_edge22.us..preheader8.us_crit_edge

._crit_edge22.us..preheader8.us_crit_edge:        ; preds = %._crit_edge22.us
  br label %.preheader8.us

.preheader7.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader9..preheader7_crit_edge, %.preheader10.lr.ph..preheader7_crit_edge, %.preheader7.loopexit
  %43 = icmp sgt i32 %1, 0
  br i1 %43, label %.preheader6.lr.ph, label %.preheader7..preheader5_crit_edge

.preheader7..preheader5_crit_edge:                ; preds = %.preheader7
  br label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %44 = icmp sgt i32 %3, 0
  %45 = sitofp i32 %3 to double
  br i1 %44, label %.preheader6.us.preheader, label %.preheader6.lr.ph..preheader5_crit_edge

.preheader6.lr.ph..preheader5_crit_edge:          ; preds = %.preheader6.lr.ph
  br label %.preheader5

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count41 = zext i32 %3 to i64
  %wide.trip.count45 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge17.us..preheader6.us_crit_edge, %.preheader6.us.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge17.us..preheader6.us_crit_edge ], [ 0, %.preheader6.us.preheader ]
  br label %46

; <label>:46:                                     ; preds = %._crit_edge66, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge66 ]
  %47 = add nuw nsw i64 %indvars.iv39, 3
  %48 = mul nuw nsw i64 %47, %indvars.iv43
  %49 = add nuw nsw i64 %48, 1
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, %3
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %45
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv43, i64 %indvars.iv39
  store double %53, double* %54, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge17.us, label %._crit_edge66

._crit_edge66:                                    ; preds = %46
  br label %46

._crit_edge17.us:                                 ; preds = %46
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader5.loopexit, label %._crit_edge17.us..preheader6.us_crit_edge

._crit_edge17.us..preheader6.us_crit_edge:        ; preds = %._crit_edge17.us
  br label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader6.lr.ph..preheader5_crit_edge, %.preheader7..preheader5_crit_edge, %.preheader8.lr.ph..preheader5_crit_edge, %.preheader5.loopexit
  %55 = icmp sgt i32 %0, 0
  br i1 %55, label %.preheader.lr.ph, label %.preheader5.._crit_edge14_crit_edge

.preheader5.._crit_edge14_crit_edge:              ; preds = %.preheader5
  br label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.preheader5
  %56 = icmp sgt i32 %3, 0
  %57 = sitofp i32 %2 to double
  br i1 %56, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge14_crit_edge

.preheader.lr.ph.._crit_edge14_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count36 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %58

; <label>:58:                                     ; preds = %._crit_edge67, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge67 ]
  %59 = add nuw nsw i64 %indvars.iv, 2
  %60 = mul nuw nsw i64 %59, %indvars.iv34
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, %2
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, %57
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv34, i64 %indvars.iv
  store double %64, double* %65, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge67

._crit_edge67:                                    ; preds = %58
  br label %58

._crit_edge.us:                                   ; preds = %58
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %._crit_edge14.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.preheader.lr.ph.._crit_edge14_crit_edge, %.preheader5.._crit_edge14_crit_edge, %._crit_edge14.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader6.lr.ph, label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge:                         ; preds = %11
  br label %._crit_edge12

.preheader6.lr.ph:                                ; preds = %11
  %13 = icmp sgt i32 %1, 0
  %14 = icmp sgt i32 %2, 0
  br i1 %13, label %.preheader6.us.preheader, label %.preheader6.lr.ph..preheader.lr.ph_crit_edge

.preheader6.lr.ph..preheader.lr.ph_crit_edge:     ; preds = %.preheader6.lr.ph
  br label %.preheader.lr.ph

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %15 = add i32 %1, -1
  %16 = zext i32 %15 to i64
  %17 = shl nuw nsw i64 %16, 3
  %18 = add nuw nsw i64 %17, 8
  %wide.trip.count72 = zext i32 %0 to i64
  %xtraiter62 = and i32 %2, 1
  %lcmp.mod63 = icmp eq i32 %xtraiter62, 0
  %19 = icmp eq i32 %2, 1
  %wide.trip.count66 = zext i32 %1 to i64
  %wide.trip.count58.1 = zext i32 %2 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge25.us..preheader6.us_crit_edge, %.preheader6.us.preheader
  %indvars.iv70 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next71, %._crit_edge25.us..preheader6.us_crit_edge ]
  br i1 %14, label %.lr.ph21.us.us.preheader, label %._crit_edge25.us.loopexit35

.lr.ph21.us.us.preheader:                         ; preds = %.preheader6.us
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 0
  br label %.lr.ph21.us.us

._crit_edge25.us.loopexit35:                      ; preds = %.preheader6.us
  %scevgep = getelementptr [900 x double], [900 x double]* %6, i64 %indvars.iv70, i64 0
  %scevgep55 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep55, i8 0, i64 %18, i32 8, i1 false)
  br label %._crit_edge25.us

._crit_edge25.us.loopexit:                        ; preds = %._crit_edge22.us.us
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge25.us.loopexit, %._crit_edge25.us.loopexit35
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %.preheader5, label %._crit_edge25.us..preheader6.us_crit_edge

._crit_edge25.us..preheader6.us_crit_edge:        ; preds = %._crit_edge25.us
  br label %.preheader6.us

.lr.ph21.us.us:                                   ; preds = %._crit_edge22.us.us..lr.ph21.us.us_crit_edge, %.lr.ph21.us.us.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge22.us.us..lr.ph21.us.us_crit_edge ], [ 0, %.lr.ph21.us.us.preheader ]
  %21 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv70, i64 %indvars.iv64
  store double 0.000000e+00, double* %21, align 8
  br i1 %lcmp.mod63, label %.lr.ph21.us.us..prol.loopexit61_crit_edge, label %.prol.preheader60

.lr.ph21.us.us..prol.loopexit61_crit_edge:        ; preds = %.lr.ph21.us.us
  br label %.prol.loopexit61

.prol.preheader60:                                ; preds = %.lr.ph21.us.us
  %22 = load double, double* %20, align 8
  %23 = fmul double %22, %4
  %24 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 0, i64 %indvars.iv64
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %21, align 8
  %28 = fadd double %27, %26
  store double %28, double* %21, align 8
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.lr.ph21.us.us..prol.loopexit61_crit_edge, %.prol.preheader60
  %indvars.iv56.unr.ph = phi i64 [ 1, %.prol.preheader60 ], [ 0, %.lr.ph21.us.us..prol.loopexit61_crit_edge ]
  br i1 %19, label %.prol.loopexit61.._crit_edge22.us.us_crit_edge, label %.lr.ph21.us.us.new.preheader

.prol.loopexit61.._crit_edge22.us.us_crit_edge:   ; preds = %.prol.loopexit61
  br label %._crit_edge22.us.us

.lr.ph21.us.us.new.preheader:                     ; preds = %.prol.loopexit61
  br label %.lr.ph21.us.us.new

._crit_edge22.us.us.loopexit:                     ; preds = %.lr.ph21.us.us.new
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %.prol.loopexit61.._crit_edge22.us.us_crit_edge, %._crit_edge22.us.us.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %._crit_edge25.us.loopexit, label %._crit_edge22.us.us..lr.ph21.us.us_crit_edge

._crit_edge22.us.us..lr.ph21.us.us_crit_edge:     ; preds = %._crit_edge22.us.us
  br label %.lr.ph21.us.us

.lr.ph21.us.us.new:                               ; preds = %.lr.ph21.us.us.new..lr.ph21.us.us.new_crit_edge, %.lr.ph21.us.us.new.preheader
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %.lr.ph21.us.us.new..lr.ph21.us.us.new_crit_edge ], [ %indvars.iv56.unr.ph, %.lr.ph21.us.us.new.preheader ]
  %29 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 %indvars.iv56
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %4
  %32 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv56, i64 %indvars.iv64
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = load double, double* %21, align 8
  %36 = fadd double %35, %34
  store double %36, double* %21, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 %indvars.iv.next57
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %4
  %40 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next57, i64 %indvars.iv64
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %21, align 8
  %44 = fadd double %43, %42
  store double %44, double* %21, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next57.1, %wide.trip.count58.1
  br i1 %exitcond59.1, label %._crit_edge22.us.us.loopexit, label %.lr.ph21.us.us.new..lr.ph21.us.us.new_crit_edge

.lr.ph21.us.us.new..lr.ph21.us.us.new_crit_edge:  ; preds = %.lr.ph21.us.us.new
  br label %.lr.ph21.us.us.new

.preheader5:                                      ; preds = %._crit_edge25.us
  %45 = icmp sgt i32 %0, 0
  br i1 %45, label %.preheader5..preheader.lr.ph_crit_edge, label %.preheader5.._crit_edge12_crit_edge

.preheader5.._crit_edge12_crit_edge:              ; preds = %.preheader5
  br label %._crit_edge12

.preheader5..preheader.lr.ph_crit_edge:           ; preds = %.preheader5
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader5..preheader.lr.ph_crit_edge, %.preheader6.lr.ph..preheader.lr.ph_crit_edge
  %46 = icmp sgt i32 %3, 0
  %47 = icmp sgt i32 %1, 0
  br i1 %46, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge12_crit_edge

.preheader.lr.ph.._crit_edge12_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge12

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %48 = add i32 %3, -1
  %wide.trip.count48 = zext i32 %0 to i64
  %xtraiter = and i32 %3, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %49 = icmp ult i32 %48, 3
  %wide.trip.count.3 = zext i32 %3 to i64
  %xtraiter40 = and i32 %1, 1
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  %50 = icmp eq i32 %1, 1
  %wide.trip.count45 = zext i32 %3 to i64
  %wide.trip.count39.1 = zext i32 %1 to i64
  %51 = add nsw i64 %wide.trip.count45, -4
  %broadcast.splatinsert83 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat84 = shufflevector <2 x double> %broadcast.splatinsert83, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge10.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next47, %._crit_edge10.us..preheader.us_crit_edge ]
  br i1 %47, label %.lr.ph.us.us.preheader, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %52 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 0
  br label %.lr.ph.us.us

.lr.ph9..lr.ph9.split_crit_edge.us.preheader:     ; preds = %.preheader.us
  br i1 %lcmp.mod, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader..lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit_crit_edge, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader

.lr.ph9..lr.ph9.split_crit_edge.us.preheader..lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit_crit_edge: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit

.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol

.lr.ph9..lr.ph9.split_crit_edge.us.prol:          ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge ], [ 0, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge ], [ %xtraiter, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.prol
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %5
  store double %55, double* %53, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge, !llvm.loop !1

.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol

.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit

.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader..lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit_crit_edge, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader..lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit ]
  br i1 %49, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.._crit_edge10.us_crit_edge, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78

.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.._crit_edge10.us_crit_edge: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit
  br label %._crit_edge10.us

.lr.ph9..lr.ph9.split_crit_edge.us.preheader78:   ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit
  %56 = sub i64 %51, %indvars.iv.unr
  %57 = lshr i64 %56, 2
  %58 = add nuw nsw i64 %57, 1
  %min.iters.check = icmp ult i64 %58, 2
  br i1 %min.iters.check, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge, label %min.iters.checked

.lr.ph9..lr.ph9.split_crit_edge.us.preheader78..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader85

min.iters.checked:                                ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78
  %n.mod.vf = and i64 %58, 1
  %n.vec = sub nsw i64 %58, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %59 = add i64 %indvars.iv.unr, 4
  %60 = shl nuw i64 %57, 2
  %61 = add i64 %59, %60
  %62 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %61, %62
  br i1 %cmp.zero, label %min.iters.checked..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge, label %vector.ph

min.iters.checked..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader85

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %63 = shl i64 %index, 2
  %64 = add i64 %indvars.iv.unr, %63
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %64
  %66 = bitcast double* %65 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %66, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec80 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec81 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec82 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %67 = fmul <2 x double> %strided.vec, %broadcast.splat84
  %68 = fmul <2 x double> %strided.vec80, %broadcast.splat84
  %69 = fmul <2 x double> %strided.vec81, %broadcast.splat84
  %70 = add nsw i64 %64, 3
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %70
  %72 = fmul <2 x double> %strided.vec82, %broadcast.splat84
  %73 = getelementptr double, double* %71, i64 -3
  %74 = bitcast double* %73 to <8 x double>*
  %75 = shufflevector <2 x double> %67, <2 x double> %68, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %76 = shufflevector <2 x double> %69, <2 x double> %72, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %75, <4 x double> %76, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %74, align 8
  %index.next = add i64 %index, 2
  %77 = icmp eq i64 %index.next, %n.vec
  br i1 %77, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.._crit_edge10.us_crit_edge, label %middle.block..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge

middle.block..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge: ; preds = %middle.block
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader85

middle.block.._crit_edge10.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge10.us

.lr.ph9..lr.ph9.split_crit_edge.us.preheader85:   ; preds = %middle.block..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge, %min.iters.checked..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge ], [ %indvars.iv.unr, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge ], [ %ind.end, %middle.block..lr.ph9..lr.ph9.split_crit_edge.us.preheader85_crit_edge ]
  br label %.lr.ph9..lr.ph9.split_crit_edge.us

.lr.ph9..lr.ph9.split_crit_edge.us:               ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader85
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge ], [ %indvars.iv.ph, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader85 ]
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv
  %79 = load double, double* %78, align 8
  %80 = fmul double %79, %5
  store double %80, double* %78, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.next
  %82 = load double, double* %81, align 8
  %83 = fmul double %82, %5
  store double %83, double* %81, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, %5
  store double %86, double* %84, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, %5
  store double %89, double* %87, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge10.us.loopexit86, label %.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge, !llvm.loop !6

.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us
  br label %.lr.ph9..lr.ph9.split_crit_edge.us

._crit_edge10.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge10.us

._crit_edge10.us.loopexit86:                      ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %middle.block.._crit_edge10.us_crit_edge, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.._crit_edge10.us_crit_edge, %._crit_edge10.us.loopexit86, %._crit_edge10.us.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge12.loopexit, label %._crit_edge10.us..preheader.us_crit_edge

._crit_edge10.us..preheader.us_crit_edge:         ; preds = %._crit_edge10.us
  br label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.lr.ph.us.us.preheader ]
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv43
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, %5
  store double %92, double* %90, align 8
  br i1 %lcmp.mod41, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %93 = load double, double* %52, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 0, i64 %indvars.iv43
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = load double, double* %90, align 8
  %98 = fadd double %97, %96
  store double %98, double* %90, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv37.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %50, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond, label %._crit_edge10.us.loopexit, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv37.unr.ph, %.lr.ph.us.us.new.preheader ]
  %99 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 %indvars.iv37
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv37, i64 %indvars.iv43
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = load double, double* %90, align 8
  %105 = fadd double %104, %103
  store double %105, double* %90, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %106 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 %indvars.iv.next38
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next38, i64 %indvars.iv43
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = load double, double* %90, align 8
  %112 = fadd double %111, %110
  store double %112, double* %90, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next38.1, %wide.trip.count39.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

._crit_edge12.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.preheader.lr.ph.._crit_edge12_crit_edge, %.preheader5.._crit_edge12_crit_edge, %.._crit_edge12_crit_edge, %._crit_edge12.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
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
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
