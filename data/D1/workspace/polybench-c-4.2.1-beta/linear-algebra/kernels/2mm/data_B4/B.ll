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
  br i1 true, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %10
  br i1 true, label %.preheader10.us.preheader, label %.preheader7

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge27.us, %.preheader10.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next62, %._crit_edge27.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge ]
  %11 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 800
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 8.000000e+02
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv57
  store double %16, double* %17, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 1100
  br i1 %exitcond60, label %._crit_edge27.us, label %._crit_edge

._crit_edge27.us:                                 ; preds = %._crit_edge
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 800
  br i1 %exitcond64, label %.preheader9.loopexit, label %.preheader10.us

.preheader9.loopexit:                             ; preds = %._crit_edge27.us
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %10
  br i1 true, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  br i1 true, label %.preheader8.us.preheader, label %.preheader5

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge22.us, %.preheader8.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next53, %._crit_edge22.us ]
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader8.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader8.us, %.prol.preheader
  %indvars.iv48.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader8.us ]
  br i1 false, label %._crit_edge22.us, label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %.prol.loopexit
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader, %.preheader8.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.preheader8.us.new ], [ %indvars.iv48.unr.ph, %.preheader8.us.new.preheader ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %18 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 900
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, 9.000000e+02
  %23 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv48
  store double %22, double* %23, align 8
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %24 = mul nuw nsw i64 %indvars.iv.next49.1, %indvars.iv52
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 900
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 9.000000e+02
  %29 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv.next49
  store double %28, double* %29, align 8
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, 900
  br i1 %exitcond51.1, label %._crit_edge22.us.loopexit, label %.preheader8.us.new

._crit_edge22.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit, %.prol.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 1100
  br i1 %exitcond55, label %.preheader7.loopexit, label %.preheader8.us

.preheader7.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader9, %.preheader10.lr.ph
  br i1 true, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  br i1 true, label %.preheader6.us.preheader, label %.preheader5

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge17.us, %.preheader6.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next44, %._crit_edge17.us ]
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge66 ]
  %30 = add nuw nsw i64 %indvars.iv39, 3
  %31 = mul nuw nsw i64 %30, %indvars.iv43
  %32 = add nuw nsw i64 %31, 1
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1200
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.200000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv43, i64 %indvars.iv39
  store double %36, double* %37, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond42, label %._crit_edge17.us, label %._crit_edge66

._crit_edge17.us:                                 ; preds = %._crit_edge66
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 900
  br i1 %exitcond46, label %.preheader5.loopexit, label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader6.lr.ph, %.preheader7, %.preheader8.lr.ph
  br i1 true, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.preheader5
  br i1 true, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv34 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next35, %._crit_edge.us ]
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge67 ]
  %38 = add nuw nsw i64 %indvars.iv, 2
  %39 = mul nuw nsw i64 %38, %indvars.iv34
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 1100
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 1.100000e+03
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv34, i64 %indvars.iv
  store double %43, double* %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge67

._crit_edge.us:                                   ; preds = %._crit_edge67
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 800
  br i1 %exitcond37, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader.lr.ph, %.preheader5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader6.lr.ph, label %._crit_edge12

.preheader6.lr.ph:                                ; preds = %11
  br i1 true, label %.preheader6.us.preheader, label %.preheader.lr.ph

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge25.us, %.preheader6.us.preheader
  %indvars.iv70 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next71, %._crit_edge25.us ]
  br i1 true, label %.lr.ph21.us.us.preheader, label %._crit_edge25.us.loopexit35

.lr.ph21.us.us.preheader:                         ; preds = %.preheader6.us
  br label %.lr.ph21.us.us

._crit_edge25.us.loopexit35:                      ; preds = %.preheader6.us
  br label %._crit_edge25.us

._crit_edge25.us.loopexit:                        ; preds = %._crit_edge22.us.us
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge25.us.loopexit, %._crit_edge25.us.loopexit35
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 800
  br i1 %exitcond73, label %.preheader.lr.ph.loopexit, label %.preheader6.us

.lr.ph21.us.us:                                   ; preds = %._crit_edge22.us.us, %.lr.ph21.us.us.preheader
  %indvars.iv64 = phi i64 [ 0, %.lr.ph21.us.us.preheader ], [ %indvars.iv.next65, %._crit_edge22.us.us ]
  %12 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv70, i64 %indvars.iv64
  store double 0.000000e+00, double* %12, align 8
  br i1 true, label %.prol.loopexit61, label %.prol.preheader60

.prol.preheader60:                                ; preds = %.lr.ph21.us.us
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.lr.ph21.us.us, %.prol.preheader60
  %indvars.iv56.unr.ph = phi i64 [ 1, %.prol.preheader60 ], [ 0, %.lr.ph21.us.us ]
  br i1 false, label %._crit_edge22.us.us, label %.lr.ph21.us.us.new.preheader

.lr.ph21.us.us.new.preheader:                     ; preds = %.prol.loopexit61
  br label %.lr.ph21.us.us.new

._crit_edge22.us.us.loopexit:                     ; preds = %.lr.ph21.us.us.new
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %._crit_edge22.us.us.loopexit, %.prol.loopexit61
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 900
  br i1 %exitcond67, label %._crit_edge25.us.loopexit, label %.lr.ph21.us.us

.lr.ph21.us.us.new:                               ; preds = %.lr.ph21.us.us.new.preheader, %.lr.ph21.us.us.new
  %13 = phi double [ %27, %.lr.ph21.us.us.new ], [ 0.000000e+00, %.lr.ph21.us.us.new.preheader ]
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %.lr.ph21.us.us.new ], [ %indvars.iv56.unr.ph, %.lr.ph21.us.us.new.preheader ]
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 %indvars.iv56
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %4
  %17 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv56, i64 %indvars.iv64
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %13, %19
  store double %20, double* %12, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 %indvars.iv.next57
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %4
  %24 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next57, i64 %indvars.iv64
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %20, %26
  store double %27, double* %12, align 8
  %indvars.iv.next57.1 = add nuw nsw i64 %indvars.iv56, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next57.1, 1100
  br i1 %exitcond59.1, label %._crit_edge22.us.us.loopexit, label %.lr.ph21.us.us.new

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge25.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader6.lr.ph
  br i1 true, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge10.us, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next47, %._crit_edge10.us ]
  br i1 true, label %.lr.ph.us.us.preheader, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  br label %.lr.ph.us.us

.lr.ph9..lr.ph9.split_crit_edge.us.preheader:     ; preds = %.preheader.us
  br i1 undef, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader

.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol

.lr.ph9..lr.ph9.split_crit_edge.us.prol:          ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader, %.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge
  br i1 true, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge, !llvm.loop !1

.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol

.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit

.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  br i1 undef, label %._crit_edge10.us, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78

.lr.ph9..lr.ph9.split_crit_edge.us.preheader78:   ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit
  br i1 undef, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader86, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78
  br i1 undef, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader86, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  br i1 true, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  br i1 undef, label %._crit_edge10.us, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader86

.lr.ph9..lr.ph9.split_crit_edge.us.preheader86:   ; preds = %middle.block, %min.iters.checked, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78
  br label %.lr.ph9..lr.ph9.split_crit_edge.us

.lr.ph9..lr.ph9.split_crit_edge.us:               ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader86, %.lr.ph9..lr.ph9.split_crit_edge.us
  br i1 true, label %._crit_edge10.us.loopexit87, label %.lr.ph9..lr.ph9.split_crit_edge.us, !llvm.loop !6

._crit_edge10.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge10.us

._crit_edge10.us.loopexit87:                      ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit87, %._crit_edge10.us.loopexit, %middle.block, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 800
  br i1 %exitcond49, label %._crit_edge12.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next44, %._crit_edge.us.us ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv43
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %5
  store double %30, double* %28, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %indvars.iv37.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 false, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond, label %._crit_edge10.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %31 = phi double [ %43, %.lr.ph.us.us.new ], [ %30, %.lr.ph.us.us.new.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %.lr.ph.us.us.new ], [ %indvars.iv37.unr.ph, %.lr.ph.us.us.new.preheader ]
  %32 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 %indvars.iv37
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv37, i64 %indvars.iv43
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %31, %36
  store double %37, double* %28, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %38 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 %indvars.iv.next38
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next38, i64 %indvars.iv43
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %37, %42
  store double %43, double* %28, align 8
  %indvars.iv.next38.1 = add nuw nsw i64 %indvars.iv37, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next38.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge12.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %.preheader.lr.ph, %11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv6, 800
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nsw i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 800
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
