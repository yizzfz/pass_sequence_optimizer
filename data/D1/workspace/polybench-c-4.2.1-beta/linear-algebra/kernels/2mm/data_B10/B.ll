; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
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

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
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
  br i1 %11, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %10
  %12 = icmp sgt i32 %2, 0
  %13 = sitofp i32 %0 to double
  br i1 %12, label %.preheader10.us.preheader, label %.preheader7

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
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv57
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

.preheader9:                                      ; preds = %.preheader9.loopexit, %10
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %22 = icmp sgt i32 %1, 0
  %23 = sitofp i32 %1 to double
  br i1 %22, label %.preheader8.us.preheader, label %.preheader5

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %wide.trip.count50 = zext i32 %1 to i64
  %wide.trip.count54 = zext i32 %2 to i64
  %xtraiter = and i64 %wide.trip.count50, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %24 = icmp eq i32 %1, 1
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge22.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge22.us ], [ 0, %.preheader8.us.preheader ]
  br i1 %lcmp.mod, label %._crit_edge66.prol.loopexit.unr-lcssa, label %._crit_edge66.prol.preheader

._crit_edge66.prol.preheader:                     ; preds = %.preheader8.us
  br label %._crit_edge66.prol

._crit_edge66.prol:                               ; preds = %._crit_edge66.prol.preheader
  %25 = trunc i64 %indvars.iv52 to i32
  %26 = srem i32 %25, %1
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %23
  %29 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 0
  store double %28, double* %29, align 8
  br label %._crit_edge66.prol.loopexit.unr-lcssa

._crit_edge66.prol.loopexit.unr-lcssa:            ; preds = %.preheader8.us, %._crit_edge66.prol
  %indvars.iv48.unr.ph = phi i64 [ 1, %._crit_edge66.prol ], [ 0, %.preheader8.us ]
  br label %._crit_edge66.prol.loopexit

._crit_edge66.prol.loopexit:                      ; preds = %._crit_edge66.prol.loopexit.unr-lcssa
  br i1 %24, label %._crit_edge22.us, label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %._crit_edge66.prol.loopexit
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66, %.preheader8.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %.preheader8.us.new ], [ %indvars.iv.next49.1, %._crit_edge66 ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %30 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, %1
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %23
  %35 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv48
  store double %34, double* %35, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %36 = mul nuw nsw i64 %indvars.iv.next49.1, %indvars.iv52
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, %1
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %23
  %41 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv.next49
  store double %40, double* %41, align 8
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50
  br i1 %exitcond51.1, label %._crit_edge22.us.unr-lcssa, label %._crit_edge66

._crit_edge22.us.unr-lcssa:                       ; preds = %._crit_edge66
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge66.prol.loopexit, %._crit_edge22.us.unr-lcssa
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %.preheader7.loopexit, label %.preheader8.us

.preheader7.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader10.lr.ph, %.preheader9
  %42 = icmp sgt i32 %1, 0
  br i1 %42, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %43 = icmp sgt i32 %3, 0
  %44 = sitofp i32 %3 to double
  br i1 %43, label %.preheader6.us.preheader, label %.preheader5

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count41 = zext i32 %3 to i64
  %wide.trip.count45 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %.preheader6.us.preheader, %._crit_edge17.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge17.us ], [ 0, %.preheader6.us.preheader ]
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge67 ]
  %45 = add nuw nsw i64 %indvars.iv39, 3
  %46 = mul nuw nsw i64 %45, %indvars.iv43
  %47 = add nuw nsw i64 %46, 1
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, %3
  %50 = sitofp i32 %49 to double
  %51 = fdiv double %50, %44
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv43, i64 %indvars.iv39
  store double %51, double* %52, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge17.us, label %._crit_edge67

._crit_edge17.us:                                 ; preds = %._crit_edge67
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader5.loopexit, label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader8.lr.ph, %.preheader6.lr.ph, %.preheader7
  br i1 %11, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.preheader5
  %53 = icmp sgt i32 %3, 0
  %54 = sitofp i32 %2 to double
  br i1 %53, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count36 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge68 ]
  %55 = add nuw nsw i64 %indvars.iv, 2
  %56 = mul nuw nsw i64 %55, %indvars.iv34
  %57 = trunc i64 %56 to i32
  %58 = srem i32 %57, %2
  %59 = sitofp i32 %58 to double
  %60 = fdiv double %59, %54
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv34, i64 %indvars.iv
  store double %60, double* %61, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge68

._crit_edge.us:                                   ; preds = %._crit_edge68
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader.lr.ph, %.preheader5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader6.lr.ph, label %._crit_edge12

.preheader6.lr.ph:                                ; preds = %11
  %13 = icmp sgt i32 %1, 0
  %14 = icmp sgt i32 %2, 0
  br i1 %13, label %.preheader6.us.preheader, label %.preheader.lr.ph

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %15 = add i32 %1, -1
  %16 = zext i32 %15 to i64
  %17 = shl nuw nsw i64 %16, 3
  %18 = add nuw nsw i64 %17, 8
  %wide.trip.count67 = zext i32 %0 to i64
  %wide.trip.count57 = zext i32 %2 to i64
  %wide.trip.count61 = zext i32 %1 to i64
  %xtraiter80 = and i64 %wide.trip.count57, 1
  %lcmp.mod81 = icmp eq i64 %xtraiter80, 0
  %19 = icmp eq i32 %2, 1
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge25.us, %.preheader6.us.preheader
  %indvars.iv65 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next66, %._crit_edge25.us ]
  br i1 %14, label %.lr.ph21.us.us.preheader, label %._crit_edge25.us.loopexit35

.lr.ph21.us.us.preheader:                         ; preds = %.preheader6.us
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv65, i64 0
  br label %.lr.ph21.us.us

._crit_edge25.us.loopexit35:                      ; preds = %.preheader6.us
  %scevgep = getelementptr [900 x double], [900 x double]* %6, i64 %indvars.iv65, i64 0
  %scevgep54 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep54, i8 0, i64 %18, i32 8, i1 false)
  br label %._crit_edge25.us

._crit_edge25.us.loopexit:                        ; preds = %._crit_edge22.us.us
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge25.us.loopexit, %._crit_edge25.us.loopexit35
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %.preheader5, label %.preheader6.us

.lr.ph21.us.us:                                   ; preds = %.lr.ph21.us.us.preheader, %._crit_edge22.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge22.us.us ], [ 0, %.lr.ph21.us.us.preheader ]
  %21 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv59
  store double 0.000000e+00, double* %21, align 8
  br i1 %lcmp.mod81, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.lr.ph21.us.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %22 = load double, double* %20, align 8
  %23 = fmul double %22, %4
  %24 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 0, i64 %indvars.iv59
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %26, 0.000000e+00
  store double %27, double* %21, align 8
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph21.us.us, %._crit_edge.prol
  %indvars.iv55.unr.ph = phi i64 [ 1, %._crit_edge.prol ], [ 0, %.lr.ph21.us.us ]
  %.unr82.ph = phi double [ %27, %._crit_edge.prol ], [ 0.000000e+00, %.lr.ph21.us.us ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  br i1 %19, label %._crit_edge22.us.us, label %.lr.ph21.us.us.new

.lr.ph21.us.us.new:                               ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge22.us.us.unr-lcssa:                    ; preds = %._crit_edge
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %._crit_edge.prol.loopexit, %._crit_edge22.us.us.unr-lcssa
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %._crit_edge25.us.loopexit, label %.lr.ph21.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph21.us.us.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr.ph, %.lr.ph21.us.us.new ], [ %indvars.iv.next56.1, %._crit_edge ]
  %28 = phi double [ %.unr82.ph, %.lr.ph21.us.us.new ], [ %42, %._crit_edge ]
  %29 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv65, i64 %indvars.iv55
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %4
  %32 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv55, i64 %indvars.iv59
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %28, %34
  store double %35, double* %21, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv65, i64 %indvars.iv.next56
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %4
  %39 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next56, i64 %indvars.iv59
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %35, %41
  store double %42, double* %21, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count57
  br i1 %exitcond58.1, label %._crit_edge22.us.us.unr-lcssa, label %._crit_edge

.preheader5:                                      ; preds = %._crit_edge25.us
  br i1 true, label %.preheader.lr.ph, label %.preheader5.._crit_edge12_crit_edge

.preheader5.._crit_edge12_crit_edge:              ; preds = %.preheader5
  br label %._crit_edge12

.preheader.lr.ph:                                 ; preds = %.preheader6.lr.ph, %.preheader5
  %43 = icmp sgt i32 %3, 0
  br i1 %43, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count47 = zext i32 %0 to i64
  %wide.trip.count39 = zext i32 %1 to i64
  %wide.trip.count43 = zext i32 %3 to i64
  %xtraiter = and i64 %wide.trip.count39, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %44 = icmp eq i32 %1, 1
  %min.iters.check = icmp ult i32 %3, 4
  %45 = and i32 %3, 3
  %n.mod.vf = zext i32 %45 to i64
  %n.vec = sub nsw i64 %wide.trip.count43, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert76 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat77 = shufflevector <2 x double> %broadcast.splatinsert76, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %45, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge10.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge10.us ], [ 0, %.preheader.us.preheader ]
  br i1 %13, label %.lr.ph.us.us.preheader, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %46 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv45, i64 0
  br label %.lr.ph.us.us

.lr.ph9..lr.ph9.split_crit_edge.us.preheader:     ; preds = %.preheader.us
  br i1 %min.iters.check, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  br i1 %cmp.zero, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv45, i64 %index
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %48, align 8
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %50, align 8
  %51 = fmul <2 x double> %wide.load, %broadcast.splat77
  %52 = fmul <2 x double> %wide.load75, %broadcast.splat77
  store <2 x double> %51, <2 x double>* %48, align 8
  store <2 x double> %52, <2 x double>* %50, align 8
  %index.next = add i64 %index, 4
  %53 = icmp eq i64 %index.next, %n.vec
  br i1 %53, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge10.us, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78

.lr.ph9..lr.ph9.split_crit_edge.us.preheader78:   ; preds = %middle.block, %min.iters.checked, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph9..lr.ph9.split_crit_edge.us

.lr.ph9..lr.ph9.split_crit_edge.us:               ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78, %.lr.ph9..lr.ph9.split_crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph9..lr.ph9.split_crit_edge.us ], [ %indvars.iv.ph, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78 ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv45, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %5
  store double %56, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count43
  br i1 %exitcond, label %._crit_edge10.us.loopexit79, label %.lr.ph9..lr.ph9.split_crit_edge.us, !llvm.loop !4

._crit_edge10.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge10.us

._crit_edge10.us.loopexit79:                      ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit79, %._crit_edge10.us.loopexit, %middle.block
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %._crit_edge12.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv45, i64 %indvars.iv41
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %5
  store double %59, double* %57, align 8
  br i1 %lcmp.mod, label %._crit_edge70.prol.loopexit.unr-lcssa, label %._crit_edge70.prol.preheader

._crit_edge70.prol.preheader:                     ; preds = %.lr.ph.us.us
  br label %._crit_edge70.prol

._crit_edge70.prol:                               ; preds = %._crit_edge70.prol.preheader
  %60 = load double, double* %46, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 0, i64 %indvars.iv41
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %59, %63
  store double %64, double* %57, align 8
  br label %._crit_edge70.prol.loopexit.unr-lcssa

._crit_edge70.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph.us.us, %._crit_edge70.prol
  %indvars.iv37.unr.ph = phi i64 [ 1, %._crit_edge70.prol ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %64, %._crit_edge70.prol ], [ %59, %.lr.ph.us.us ]
  br label %._crit_edge70.prol.loopexit

._crit_edge70.prol.loopexit:                      ; preds = %._crit_edge70.prol.loopexit.unr-lcssa
  br i1 %44, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge70.prol.loopexit
  br label %._crit_edge70

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge70
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge70.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge10.us.loopexit, label %.lr.ph.us.us

._crit_edge70:                                    ; preds = %._crit_edge70, %.lr.ph.us.us.new
  %indvars.iv37 = phi i64 [ %indvars.iv37.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next38.1, %._crit_edge70 ]
  %65 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %77, %._crit_edge70 ]
  %66 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv45, i64 %indvars.iv37
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv37, i64 %indvars.iv41
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %57, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %72 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv45, i64 %indvars.iv.next38
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next38, i64 %indvars.iv41
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %71, %76
  store double %77, double* %57, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next38.1, %wide.trip.count39
  br i1 %exitcond40.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge70

._crit_edge12.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.preheader5.._crit_edge12_crit_edge, %._crit_edge12.loopexit, %11, %.preheader.lr.ph
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
