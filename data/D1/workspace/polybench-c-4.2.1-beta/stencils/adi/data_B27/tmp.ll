; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge3.us, %._crit_edge.lr.ph
  %indvars.iv6 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next7, %._crit_edge3.us ]
  %1 = add nuw nsw i64 %indvars.iv6, 1000
  %2 = trunc i64 %1 to i32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %3 = trunc i64 %indvars.iv to i32
  %4 = sub nuw nsw i32 %2, %3
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %8 = sub nuw nsw i32 %2, %7
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %5, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fdiv <2 x double> %11, <double 1.000000e+03, double 1.000000e+03>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond10.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond10.1, label %._crit_edge3.us, label %._crit_edge

._crit_edge3.us:                                  ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond, label %._crit_edge5, label %._crit_edge.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
._crit_edge.lr.ph:
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge24, %._crit_edge.lr.ph
  %.0325 = phi i32 [ 1, %._crit_edge.lr.ph ], [ %140, %._crit_edge24 ]
  br label %._crit_edge44.lver.check

._crit_edge44.lver.check:                         ; preds = %._crit_edge, %._crit_edge11.us
  %indvar = phi i64 [ 0, %._crit_edge ], [ %4, %._crit_edge11.us ]
  %indvars.iv29 = phi i64 [ 1, %._crit_edge ], [ %indvars.iv.next30, %._crit_edge11.us ]
  %4 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 999
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv29
  store double 1.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29, i64 0
  store double 0.000000e+00, double* %6, align 8
  %7 = bitcast double* %5 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29
  %10 = bitcast [1000 x double]* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = add nsw i64 %indvars.iv29, -1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge44.lver.orig.preheader, label %._crit_edge44.ph

._crit_edge44.lver.orig.preheader:                ; preds = %._crit_edge44.lver.check
  br label %._crit_edge44.lver.orig

._crit_edge44.lver.orig:                          ; preds = %._crit_edge44.lver.orig.preheader, %._crit_edge44.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %._crit_edge44.lver.orig ], [ 1, %._crit_edge44.lver.orig.preheader ]
  %12 = add nsw i64 %indvars.iv.lver.orig, -1
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29, i64 %12
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, 0xC09F400000000001
  %16 = fadd double %15, 0x40AF420000000001
  %17 = fdiv double 0x409F400000000001, %16
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.lver.orig
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %11
  %20 = bitcast double* %19 to <2 x double>*
  %21 = load <2 x double>, <2 x double>* %20, align 8
  %22 = fmul <2 x double> %21, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %23 = extractelement <2 x double> %22, i32 0
  %24 = extractelement <2 x double> %22, i32 1
  %25 = fsub double %24, %23
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next30
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, 0xC08F400000000001
  %29 = fsub double %25, %28
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %12
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, 0xC09F400000000001
  %33 = fsub double %29, %32
  %34 = fdiv double %33, %16
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv.lver.orig
  store double %34, double* %35, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond46.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond46.lver.orig, label %._crit_edge7.us.loopexit, label %._crit_edge44.lver.orig

._crit_edge44.ph:                                 ; preds = %._crit_edge44.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial10 = load double, double* %scevgep4, align 8
  br label %._crit_edge44

._crit_edge11.us:                                 ; preds = %.lr.ph10.us
  %exitcond = icmp eq i64 %indvars.iv.next30, 999
  br i1 %exitcond, label %._crit_edge45.lver.check.preheader, label %._crit_edge44.lver.check

._crit_edge45.lver.check.preheader:               ; preds = %._crit_edge11.us
  br label %._crit_edge45.lver.check

.lr.ph10.us:                                      ; preds = %.lr.ph10.us, %._crit_edge7.us
  %indvars.iv27 = phi i64 [ 998, %._crit_edge7.us ], [ %indvars.iv.next28.1, %.lr.ph10.us ]
  %36 = phi double [ 1.000000e+00, %._crit_edge7.us ], [ %49, %.lr.ph10.us ]
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv27
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %36
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv27
  %41 = load double, double* %40, align 8
  %42 = fadd double %39, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv29
  store double %42, double* %43, align 8
  %indvars.iv.next28 = add nsw i64 %indvars.iv27, -1
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next28
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %42
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv.next28
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next28, i64 %indvars.iv29
  store double %49, double* %50, align 8
  %51 = icmp sgt i64 %indvars.iv.next28, 1
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, -2
  br i1 %51, label %.lr.ph10.us, label %._crit_edge11.us

._crit_edge44:                                    ; preds = %._crit_edge44, %._crit_edge44.ph
  %store_forwarded11 = phi double [ %load_initial10, %._crit_edge44.ph ], [ %69, %._crit_edge44 ]
  %store_forwarded = phi double [ %load_initial, %._crit_edge44.ph ], [ %54, %._crit_edge44 ]
  %indvars.iv = phi i64 [ 1, %._crit_edge44.ph ], [ %indvars.iv.next, %._crit_edge44 ]
  %52 = fmul double %store_forwarded, 0xC09F400000000001
  %53 = fadd double %52, 0x40AF420000000001
  %54 = fdiv double 0x409F400000000001, %53
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv
  store double %54, double* %55, align 8
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %11
  %57 = bitcast double* %56 to <2 x double>*
  %58 = load <2 x double>, <2 x double>* %57, align 8
  %59 = fmul <2 x double> %58, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %60 = extractelement <2 x double> %59, i32 0
  %61 = extractelement <2 x double> %59, i32 1
  %62 = fsub double %61, %60
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next30
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, 0xC08F400000000001
  %66 = fsub double %62, %65
  %67 = fmul double %store_forwarded11, 0xC09F400000000001
  %68 = fsub double %66, %67
  %69 = fdiv double %68, %53
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv
  store double %69, double* %70, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond46, label %._crit_edge7.us.loopexit33, label %._crit_edge44

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge44.lver.orig
  br label %._crit_edge7.us

._crit_edge7.us.loopexit33:                       ; preds = %._crit_edge44
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit33, %._crit_edge7.us.loopexit
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv29
  store double 1.000000e+00, double* %71, align 8
  br label %.lr.ph10.us

._crit_edge45.lver.check:                         ; preds = %._crit_edge45.lver.check.preheader, %._crit_edge21.us
  %indvar12 = phi i64 [ %72, %._crit_edge21.us ], [ 0, %._crit_edge45.lver.check.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge21.us ], [ 1, %._crit_edge45.lver.check.preheader ]
  %72 = add i64 %indvar12, 1
  %scevgep14 = getelementptr [1000 x double], [1000 x double]* %2, i64 %72, i64 0
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %2, i64 %72, i64 999
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %3, i64 %72, i64 0
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %3, i64 %72, i64 999
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv39, i64 0
  store double 1.000000e+00, double* %73, align 8
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %74, align 8
  %75 = bitcast double* %73 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39
  %78 = bitcast [1000 x double]* %77 to i64*
  store i64 %76, i64* %78, align 8
  %79 = add nsw i64 %indvars.iv39, -1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound022 = icmp ult double* %scevgep14, %scevgep20
  %bound123 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict25 = and i1 %bound022, %bound123
  br i1 %memcheck.conflict25, label %._crit_edge45.lver.orig.preheader, label %._crit_edge45.ph

._crit_edge45.lver.orig.preheader:                ; preds = %._crit_edge45.lver.check
  br label %._crit_edge45.lver.orig

._crit_edge45.lver.orig:                          ; preds = %._crit_edge45.lver.orig.preheader, %._crit_edge45.lver.orig
  %indvars.iv33.lver.orig = phi i64 [ %indvars.iv.next34.lver.orig, %._crit_edge45.lver.orig ], [ 1, %._crit_edge45.lver.orig.preheader ]
  %80 = add nsw i64 %indvars.iv33.lver.orig, -1
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %80
  %82 = load double, double* %81, align 8
  %83 = fmul double %82, 0xC08F400000000001
  %84 = fadd double %83, 0x409F440000000001
  %85 = fdiv double 0x408F400000000001, %84
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  store double %85, double* %86, align 8
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv33.lver.orig
  %88 = load double, double* %87, align 8
  %89 = fmul double %88, 0xC09F400000000001
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, 0xC0AF3E0000000001
  %93 = fsub double %92, %89
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next40, i64 %indvars.iv33.lver.orig
  %95 = load double, double* %94, align 8
  %96 = fmul double %95, 0xC09F400000000001
  %97 = fsub double %93, %96
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %80
  %99 = load double, double* %98, align 8
  %100 = fmul double %99, 0xC08F400000000001
  %101 = fsub double %97, %100
  %102 = fdiv double %101, %84
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv33.lver.orig
  store double %102, double* %103, align 8
  %indvars.iv.next34.lver.orig = add nuw nsw i64 %indvars.iv33.lver.orig, 1
  %exitcond47.lver.orig = icmp eq i64 %indvars.iv.next34.lver.orig, 999
  br i1 %exitcond47.lver.orig, label %._crit_edge17.us.loopexit, label %._crit_edge45.lver.orig

._crit_edge45.ph:                                 ; preds = %._crit_edge45.lver.check
  %load_initial27 = load double, double* %scevgep14, align 8
  %load_initial30 = load double, double* %scevgep18, align 8
  br label %._crit_edge45

._crit_edge21.us:                                 ; preds = %.lr.ph20.us
  %exitcond48 = icmp eq i64 %indvars.iv.next40, 999
  br i1 %exitcond48, label %._crit_edge24, label %._crit_edge45.lver.check

.lr.ph20.us:                                      ; preds = %.lr.ph20.us, %._crit_edge17.us
  %indvars.iv37 = phi i64 [ 998, %._crit_edge17.us ], [ %indvars.iv.next38.1, %.lr.ph20.us ]
  %104 = phi double [ 1.000000e+00, %._crit_edge17.us ], [ %117, %.lr.ph20.us ]
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv37
  %106 = load double, double* %105, align 8
  %107 = fmul double %106, %104
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv37
  %109 = load double, double* %108, align 8
  %110 = fadd double %107, %109
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv37
  store double %110, double* %111, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, -1
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next38
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, %110
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv.next38
  %116 = load double, double* %115, align 8
  %117 = fadd double %114, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.next38
  store double %117, double* %118, align 8
  %119 = icmp sgt i64 %indvars.iv.next38, 1
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, -2
  br i1 %119, label %.lr.ph20.us, label %._crit_edge21.us

._crit_edge45:                                    ; preds = %._crit_edge45, %._crit_edge45.ph
  %store_forwarded31 = phi double [ %load_initial30, %._crit_edge45.ph ], [ %137, %._crit_edge45 ]
  %store_forwarded28 = phi double [ %load_initial27, %._crit_edge45.ph ], [ %122, %._crit_edge45 ]
  %indvars.iv33 = phi i64 [ 1, %._crit_edge45.ph ], [ %indvars.iv.next34, %._crit_edge45 ]
  %120 = fmul double %store_forwarded28, 0xC08F400000000001
  %121 = fadd double %120, 0x409F440000000001
  %122 = fdiv double 0x408F400000000001, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv33
  store double %122, double* %123, align 8
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv33
  %125 = load double, double* %124, align 8
  %126 = fmul double %125, 0xC09F400000000001
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv33
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, 0xC0AF3E0000000001
  %130 = fsub double %129, %126
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next40, i64 %indvars.iv33
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, 0xC09F400000000001
  %134 = fsub double %130, %133
  %135 = fmul double %store_forwarded31, 0xC08F400000000001
  %136 = fsub double %134, %135
  %137 = fdiv double %136, %121
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv33
  store double %137, double* %138, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next34, 999
  br i1 %exitcond47, label %._crit_edge17.us.loopexit32, label %._crit_edge45

._crit_edge17.us.loopexit:                        ; preds = %._crit_edge45.lver.orig
  br label %._crit_edge17.us

._crit_edge17.us.loopexit32:                      ; preds = %._crit_edge45
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit32, %._crit_edge17.us.loopexit
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv39, i64 999
  store double 1.000000e+00, double* %139, align 8
  br label %.lr.ph20.us

._crit_edge24:                                    ; preds = %._crit_edge21.us
  %exitcond43 = icmp eq i32 %.0325, 500
  %140 = add nuw nsw i32 %.0325, 1
  br i1 %exitcond43, label %._crit_edge26, label %._crit_edge

._crit_edge26:                                    ; preds = %._crit_edge24
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge4.us, %._crit_edge.us.preheader
  %indvars.iv7 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next8, %._crit_edge4.us ]
  %5 = mul nuw nsw i64 %indvars.iv7, 1000
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge2.us

; <label>:10:                                     ; preds = %._crit_edge2.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond11, label %._crit_edge4.us, label %._crit_edge2.us._crit_edge

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge.us

._crit_edge6:                                     ; preds = %._crit_edge4.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
