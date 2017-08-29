; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %.cast = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %.cast)
  call void (...) @polybench_timer_start() #4
  %7 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %7, [1000 x double]* %6, [1200 x double]* %.cast)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %8 = icmp sgt i32 %0, 42
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %2
  %10 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %10, align 1
  %11 = icmp eq i8 %strcmpload, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %.cast)
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %2, %12
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge24.us, %.preheader.lr.ph
  %indvars.iv43 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next44, %._crit_edge24.us ]
  %5 = add nuw i64 %indvars.iv43, 4294967295
  %6 = icmp sgt i64 %indvars.iv43, 0
  br i1 %6, label %.lr.ph.us, label %._crit_edge.us

.lr.ph.us:                                        ; preds = %.preheader.us
  %xtraiter62 = and i64 %indvars.iv43, 1
  %lcmp.mod = icmp eq i64 %xtraiter62, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %7 = trunc i64 %indvars.iv43 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 0
  store double %10, double* %11, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %12 = trunc i64 %5 to i32
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %14 = add nuw nsw i64 %indvars.iv, %indvars.iv43
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = add nuw nsw i64 %indvars.iv.next, %indvars.iv43
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1000
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %17, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fdiv <2 x double> %24, <double 1.000000e+03, double 1.000000e+03>
  %26 = bitcast double* %18 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv43
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv43
  store double 1.000000e+00, double* %27, align 8
  %28 = trunc i64 %indvars.iv43 to i32
  %29 = add i32 %28, 1200
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new, %._crit_edge.us
  %indvars.iv32 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next33.1, %._crit_edge.us.new ]
  %30 = trunc i64 %indvars.iv32 to i32
  %31 = sub i32 %29, %30
  %32 = srem i32 %31, 1200
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv32
  %35 = trunc i64 %indvars.iv32 to i32
  %36 = or i32 %35, 1
  %37 = sub i32 %29, %36
  %38 = srem i32 %37, 1200
  %39 = sitofp i32 %38 to double
  %40 = insertelement <2 x double> undef, double %33, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  %42 = fdiv <2 x double> %41, <double 1.200000e+03, double 1.200000e+03>
  %43 = bitcast double* %34 to <2 x double>*
  store <2 x double> %42, <2 x double>* %43, align 8
  %indvars.iv.next33.1 = add nuw nsw i64 %indvars.iv32, 2
  %exitcond.140 = icmp eq i64 %indvars.iv.next33.1, 1200
  br i1 %exitcond.140, label %._crit_edge24.us, label %._crit_edge.us.new

._crit_edge24.us:                                 ; preds = %._crit_edge.us.new
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, 1000
  br i1 %exitcond, label %._crit_edge28, label %.preheader.us

._crit_edge28:                                    ; preds = %._crit_edge24.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader23.us.preheader:
  %5 = insertelement <2 x double> undef, double %2, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader23.us

.preheader23.us:                                  ; preds = %._crit_edge28.us..preheader23.us_crit_edge, %.preheader23.us.preheader
  %indvars.iv54 = phi i64 [ 0, %.preheader23.us.preheader ], [ %indvars.iv.next55, %._crit_edge28.us..preheader23.us_crit_edge ]
  %indvars.iv43 = phi i64 [ 1, %.preheader23.us.preheader ], [ %indvars.iv.next44, %._crit_edge28.us..preheader23.us_crit_edge ]
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %7 = icmp slt i64 %indvars.iv.next55, 1000
  br i1 %7, label %.preheader.us.us.preheader, label %.preheader.us32.preheader

.preheader.us32.preheader:                        ; preds = %.preheader23.us
  br label %.preheader.us32

.preheader.us.us.preheader:                       ; preds = %.preheader23.us
  %8 = sub nsw i64 0, %indvars.iv54
  %9 = trunc i64 %8 to i32
  %10 = and i32 %9, 1
  %lcmp.mod49 = icmp eq i32 %10, 0
  %11 = icmp eq i32 %9, -998
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv43, i64 %indvars.iv54
  %indvars.iv.next46.prol = add nuw nsw i64 %indvars.iv43, 1
  br label %.preheader.us.us

.preheader.us32:                                  ; preds = %.preheader.us32, %.preheader.us32.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us32.preheader ], [ %indvars.iv.next.3.1, %.preheader.us32 ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv
  %14 = bitcast double* %13 to <2 x double>*
  %15 = load <2 x double>, <2 x double>* %14, align 8
  %16 = fmul <2 x double> %15, %6
  store <2 x double> %16, <2 x double>* %14, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next.1
  %18 = bitcast double* %17 to <2 x double>*
  %19 = load <2 x double>, <2 x double>* %18, align 8
  %20 = fmul <2 x double> %19, %6
  store <2 x double> %20, <2 x double>* %18, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next.3
  %22 = bitcast double* %21 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = fmul <2 x double> %23, %6
  store <2 x double> %24, <2 x double>* %22, align 8
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next.1.1
  %26 = bitcast double* %25 to <2 x double>*
  %27 = load <2 x double>, <2 x double>* %26, align 8
  %28 = fmul <2 x double> %27, %6
  store <2 x double> %28, <2 x double>* %26, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %._crit_edge28.us.loopexit73, label %.preheader.us32

._crit_edge28.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge28.us

._crit_edge28.us.loopexit73:                      ; preds = %.preheader.us32
  br label %._crit_edge28.us

._crit_edge28.us:                                 ; preds = %._crit_edge28.us.loopexit73, %._crit_edge28.us.loopexit
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 1000
  br i1 %exitcond57, label %._crit_edge31, label %._crit_edge28.us..preheader23.us_crit_edge

._crit_edge28.us..preheader23.us_crit_edge:       ; preds = %._crit_edge28.us
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  br label %.preheader23.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv51 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next52, %._crit_edge.us.us ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv51
  br i1 %lcmp.mod49, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us.us
  %30 = load double, double* %12, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv43, i64 %indvars.iv51
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %29, align 8
  %35 = fadd double %34, %33
  store double %35, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us.us, %.prol.preheader
  %indvars.iv45.unr.ph = phi i64 [ %indvars.iv.next46.prol, %.prol.preheader ], [ %indvars.iv43, %.preheader.us.us ]
  %.pre63 = load double, double* %29, align 8
  br i1 %11, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %36 = phi double [ %.pre63, %.prol.loopexit ], [ %50, %._crit_edge.us.us.loopexit ]
  %37 = fmul double %36, %2
  store double %37, double* %29, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond = icmp eq i64 %indvars.iv.next52, 1200
  br i1 %exitcond, label %._crit_edge28.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %38 = phi double [ %50, %.preheader.us.us.new ], [ %.pre63, %.preheader.us.us.new.preheader ]
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.1, %.preheader.us.us.new ], [ %indvars.iv45.unr.ph, %.preheader.us.us.new.preheader ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv45, i64 %indvars.iv54
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv51
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %38, %43
  store double %44, double* %29, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next46, i64 %indvars.iv54
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next46, i64 %indvars.iv51
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %44, %49
  store double %50, double* %29, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next46.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge31:                                    ; preds = %._crit_edge28.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv14, 1000
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge19
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge19

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond17, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
