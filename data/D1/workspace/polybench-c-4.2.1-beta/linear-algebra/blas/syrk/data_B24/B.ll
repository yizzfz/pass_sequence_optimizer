; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader28.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge35.us, %.preheader28.lr.ph
  %indvars.iv47 = phi i64 [ 0, %.preheader28.lr.ph ], [ %indvars.iv.next48, %._crit_edge35.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader28.us
  %indvars.iv43 = phi i64 [ 0, %.preheader28.us ], [ %indvars.iv.next44, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv43, %indvars.iv47
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1200
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv47, i64 %indvars.iv43
  store double %11, double* %12, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next44, 1000
  br i1 %exitcond54, label %._crit_edge35.us, label %._crit_edge

._crit_edge35.us:                                 ; preds = %._crit_edge
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next48, 1200
  br i1 %exitcond55, label %.preheader.us.preheader, label %.preheader28.us

.preheader.us.preheader:                          ; preds = %._crit_edge35.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge56

._crit_edge56:                                    ; preds = %._crit_edge56, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge56 ]
  %13 = mul nuw nsw i64 %indvars.iv, %indvars.iv39
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond53, label %._crit_edge.us, label %._crit_edge56

._crit_edge.us:                                   ; preds = %._crit_edge56
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond, label %._crit_edge32, label %.preheader.us

._crit_edge32:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader28.lr.ph:
  %6 = insertelement <2 x double> undef, double %3, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = insertelement <2 x double> undef, double %3, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv
  %11 = bitcast double* %10 to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %13 = fmul <2 x double> %12, %7
  %14 = bitcast double* %10 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next.1
  %16 = bitcast double* %15 to <2 x double>*
  %17 = load <2 x double>, <2 x double>* %16, align 8
  %18 = fmul <2 x double> %17, %9
  %19 = bitcast double* %15 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv63
  br i1 %exitcond.3, label %.preheader.us38.preheader.loopexit, label %.lr.ph.us.new

.preheader.us38.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us38.preheader

.preheader.us38.preheader:                        ; preds = %.preheader.us38.preheader.loopexit, %.prol.loopexit
  %xtraiter5685 = and i64 %indvars.iv.next66, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter5685, 0
  %20 = icmp eq i64 %indvars.iv65, 0
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 0
  br label %.preheader.us38

.preheader.us38:                                  ; preds = %._crit_edge.us42, %.preheader.us38.preheader
  %indvars.iv59 = phi i64 [ 0, %.preheader.us38.preheader ], [ %indvars.iv.next60, %._crit_edge.us42 ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv59
  br i1 %lcmp.mod57, label %.prol.loopexit55, label %.prol.preheader54

.prol.preheader54:                                ; preds = %.preheader.us38
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv59
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = load double, double* %21, align 8
  %29 = fadd double %28, %27
  store double %29, double* %21, align 8
  br label %.prol.loopexit55

.prol.loopexit55:                                 ; preds = %.preheader.us38, %.prol.preheader54
  %indvars.iv49.unr.ph = phi i64 [ 1, %.prol.preheader54 ], [ 0, %.preheader.us38 ]
  br i1 %20, label %._crit_edge.us42, label %.preheader.us38.new.preheader

.preheader.us38.new.preheader:                    ; preds = %.prol.loopexit55
  br label %.preheader.us38.new

.preheader.us38.new:                              ; preds = %.preheader.us38.new.preheader, %.preheader.us38.new
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.preheader.us38.new ], [ %indvars.iv49.unr.ph, %.preheader.us38.new.preheader ]
  %30 = load double, double* %22, align 8
  %31 = fmul double %30, %2
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv59
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv49
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %34
  store double %37, double* %35, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %38 = load double, double* %22, align 8
  %39 = fmul double %38, %2
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next50, i64 %indvars.iv59
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next50
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %43, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next50.1, %indvars.iv63
  br i1 %exitcond.1, label %._crit_edge.us42.loopexit, label %.preheader.us38.new

.lr.ph.us:                                        ; preds = %._crit_edge33.us..lr.ph.us_crit_edge, %.preheader28.lr.ph
  %indvars.iv87 = phi i2 [ 1, %.preheader28.lr.ph ], [ %indvars.iv.next88, %._crit_edge33.us..lr.ph.us_crit_edge ]
  %indvars.iv65 = phi i64 [ 0, %.preheader28.lr.ph ], [ %indvars.iv.next66, %._crit_edge33.us..lr.ph.us_crit_edge ]
  %indvars.iv63 = phi i64 [ 1, %.preheader28.lr.ph ], [ %indvars.iv.next64, %._crit_edge33.us..lr.ph.us_crit_edge ]
  %46 = zext i2 %indvars.iv87 to i64
  %47 = add nuw nsw i64 %46, 4294967295
  %48 = and i64 %47, 4294967295
  %49 = add nuw nsw i64 %48, 1
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %50 = trunc i64 %indvars.iv.next66 to i32
  %xtraiter = and i32 %50, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.prol
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %3
  store double %53, double* %51, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %49, %.prol.loopexit.loopexit ]
  %54 = icmp ult i64 %indvars.iv65, 3
  br i1 %54, label %.preheader.us38.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  br label %.lr.ph.us.new

._crit_edge.us42.loopexit:                        ; preds = %.preheader.us38.new
  br label %._crit_edge.us42

._crit_edge.us42:                                 ; preds = %._crit_edge.us42.loopexit, %.prol.loopexit55
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next60, 1000
  br i1 %exitcond89, label %._crit_edge33.us, label %.preheader.us38

._crit_edge33.us:                                 ; preds = %._crit_edge.us42
  %exitcond = icmp eq i64 %indvars.iv.next66, 1200
  br i1 %exitcond, label %._crit_edge37, label %._crit_edge33.us..lr.ph.us_crit_edge

._crit_edge33.us..lr.ph.us_crit_edge:             ; preds = %._crit_edge33.us
  %indvars.iv.next88 = add i2 %indvars.iv87, 1
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  br label %.lr.ph.us

._crit_edge37:                                    ; preds = %._crit_edge33.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge12.us ]
  %6 = mul nuw nsw i64 %indvars.iv15, 1200
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %._crit_edge.us._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond19, label %._crit_edge12.us, label %._crit_edge.us._crit_edge

._crit_edge12.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
