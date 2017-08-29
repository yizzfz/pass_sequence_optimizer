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
.._crit_edge_crit_edge.lr.ph:
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.lr.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.lr.ph ]
  %1 = add nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next.1, %._crit_edge.us ]
  %2 = sub nuw nsw i64 %1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %6 = sub nuw nsw i64 %1, %indvars.iv.next
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %4, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> %10, <double 1.000000e+03, double 1.000000e+03>
  %12 = bitcast double* %5 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond, label %._crit_edge12, label %.._crit_edge_crit_edge.us

._crit_edge12:                                    ; preds = %._crit_edge._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.._crit_edge_crit_edge.lr.ph:
  br label %.lr.ph137.split.us.preheader

.lr.ph137.split.us.preheader:                     ; preds = %._crit_edge128._crit_edge, %.._crit_edge_crit_edge.lr.ph
  %storemerge148 = phi i32 [ 1, %.._crit_edge_crit_edge.lr.ph ], [ %144, %._crit_edge128._crit_edge ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge.us, %.lr.ph137.split.us.preheader
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge.us ], [ 1, %.lr.ph137.split.us.preheader ]
  %indvar = phi i64 [ %4, %._crit_edge.us ], [ 0, %.lr.ph137.split.us.preheader ]
  %4 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 999
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv36
  store double 1.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 0
  store double 0.000000e+00, double* %6, align 8
  %7 = bitcast double* %5 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36
  %10 = bitcast [1000 x double]* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = add nsw i64 %indvars.iv36, -1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %12 = add nsw i64 %indvars.iv.lver.orig, -1
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %12
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, 0xC09F400000000001
  %16 = fadd double %15, 0x40AF420000000001
  %17 = fdiv double 0x409F400000000001, %16
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.lver.orig
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %11
  %20 = bitcast double* %19 to <2 x double>*
  %21 = load <2 x double>, <2 x double>* %20, align 8
  %22 = fmul <2 x double> %21, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %23 = extractelement <2 x double> %22, i32 0
  %24 = extractelement <2 x double> %22, i32 1
  %25 = fsub double %24, %23
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next37
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, 0xC08F400000000001
  %29 = fsub double %25, %28
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %12
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, 0xC09F400000000001
  %33 = fsub double %29, %32
  %34 = fdiv double %33, %16
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv.lver.orig
  store double %34, double* %35, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %.lr.ph134.us.preheader.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial10 = load double, double* %scevgep4, align 8
  br label %52

._crit_edge.us:                                   ; preds = %.lr.ph134.us
  %exitcond38 = icmp eq i64 %4, 998
  br i1 %exitcond38, label %.lver.check26.preheader, label %.lver.check

.lver.check26.preheader:                          ; preds = %._crit_edge.us
  br label %.lver.check26

.lr.ph134.us:                                     ; preds = %.lr.ph134.us, %.lr.ph134.us.preheader
  %indvars.iv150 = phi i64 [ 998, %.lr.ph134.us.preheader ], [ %indvars.iv.next151.1, %.lr.ph134.us ]
  %36 = phi double [ 1.000000e+00, %.lr.ph134.us.preheader ], [ %49, %.lr.ph134.us ]
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv150
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %36
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv150
  %41 = load double, double* %40, align 8
  %42 = fadd double %39, %41
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv150, i64 %indvars.iv36
  store double %42, double* %43, align 8
  %indvars.iv.next151 = add nsw i64 %indvars.iv150, -1
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.next151
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %42
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv.next151
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next151, i64 %indvars.iv36
  store double %49, double* %50, align 8
  %indvars.iv.next151.1 = add nsw i64 %indvars.iv150, -2
  %51 = icmp sgt i64 %indvars.iv.next151, 1
  br i1 %51, label %.lr.ph134.us, label %._crit_edge.us

; <label>:52:                                     ; preds = %52, %.ph
  %store_forwarded11 = phi double [ %load_initial10, %.ph ], [ %70, %52 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %55, %52 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %52 ]
  %53 = fmul double %store_forwarded, 0xC09F400000000001
  %54 = fadd double %53, 0x40AF420000000001
  %55 = fdiv double 0x409F400000000001, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv
  store double %55, double* %56, align 8
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %11
  %58 = bitcast double* %57 to <2 x double>*
  %59 = load <2 x double>, <2 x double>* %58, align 8
  %60 = fmul <2 x double> %59, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fsub double %62, %61
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next37
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, 0xC08F400000000001
  %67 = fsub double %63, %66
  %68 = fmul double %store_forwarded11, 0xC09F400000000001
  %69 = fsub double %67, %68
  %70 = fdiv double %69, %54
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv
  store double %70, double* %71, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %.lr.ph134.us.preheader.loopexit43, label %52

.lr.ph134.us.preheader.loopexit:                  ; preds = %.ph.lver.orig
  br label %.lr.ph134.us.preheader

.lr.ph134.us.preheader.loopexit43:                ; preds = %52
  br label %.lr.ph134.us.preheader

.lr.ph134.us.preheader:                           ; preds = %.lr.ph134.us.preheader.loopexit43, %.lr.ph134.us.preheader.loopexit
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv36
  store double 1.000000e+00, double* %72, align 8
  br label %.lr.ph134.us

.lver.check26:                                    ; preds = %._crit_edge128.us, %.lver.check26.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge128.us ], [ 1, %.lver.check26.preheader ]
  %indvar12 = phi i64 [ %73, %._crit_edge128.us ], [ 0, %.lver.check26.preheader ]
  %73 = add nuw nsw i64 %indvar12, 1
  %scevgep14 = getelementptr [1000 x double], [1000 x double]* %2, i64 %73, i64 0
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %2, i64 %73, i64 999
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %3, i64 %73, i64 0
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %3, i64 %73, i64 999
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv39, i64 0
  store double 1.000000e+00, double* %74, align 8
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %75, align 8
  %76 = bitcast double* %74 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39
  %79 = bitcast [1000 x double]* %78 to i64*
  store i64 %77, i64* %79, align 8
  %80 = add nsw i64 %indvars.iv39, -1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound022 = icmp ult double* %scevgep14, %scevgep20
  %bound123 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict25 = and i1 %bound022, %bound123
  br i1 %memcheck.conflict25, label %.ph27.lver.orig.preheader, label %.ph27

.ph27.lver.orig.preheader:                        ; preds = %.lver.check26
  br label %.ph27.lver.orig

.ph27.lver.orig:                                  ; preds = %.ph27.lver.orig.preheader, %.ph27.lver.orig
  %indvars.iv152.lver.orig = phi i64 [ %indvars.iv.next153.lver.orig, %.ph27.lver.orig ], [ 1, %.ph27.lver.orig.preheader ]
  %81 = add nsw i64 %indvars.iv152.lver.orig, -1
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %81
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, 0xC08F400000000001
  %85 = fadd double %84, 0x409F440000000001
  %86 = fdiv double 0x408F400000000001, %85
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv152.lver.orig
  store double %86, double* %87, align 8
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %80, i64 %indvars.iv152.lver.orig
  %89 = load double, double* %88, align 8
  %90 = fmul double %89, 0xC09F400000000001
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv152.lver.orig
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, 0xC0AF3E0000000001
  %94 = fsub double %93, %90
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next40, i64 %indvars.iv152.lver.orig
  %96 = load double, double* %95, align 8
  %97 = fmul double %96, 0xC09F400000000001
  %98 = fsub double %94, %97
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %81
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, 0xC08F400000000001
  %102 = fsub double %98, %101
  %103 = fdiv double %102, %85
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv152.lver.orig
  store double %103, double* %104, align 8
  %indvars.iv.next153.lver.orig = add nuw nsw i64 %indvars.iv152.lver.orig, 1
  %exitcond154.lver.orig = icmp eq i64 %indvars.iv.next153.lver.orig, 999
  br i1 %exitcond154.lver.orig, label %.lr.ph144.us.preheader.loopexit, label %.ph27.lver.orig

.ph27:                                            ; preds = %.lver.check26
  %load_initial29 = load double, double* %scevgep14, align 8
  %load_initial32 = load double, double* %scevgep18, align 8
  br label %123

._crit_edge128.us:                                ; preds = %.lr.ph144.us
  %exitcond41 = icmp eq i64 %73, 998
  br i1 %exitcond41, label %._crit_edge128._crit_edge, label %.lver.check26

.lr.ph144.us:                                     ; preds = %.lr.ph144.us, %.lr.ph144.us.preheader
  %indvars.iv155 = phi i64 [ 998, %.lr.ph144.us.preheader ], [ %indvars.iv.next156.1, %.lr.ph144.us ]
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv155
  %106 = load double, double* %105, align 8
  %107 = or i64 %indvars.iv155, 1
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv39, i64 %107
  %109 = load double, double* %108, align 8
  %110 = fmul double %106, %109
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv155
  %112 = load double, double* %111, align 8
  %113 = fadd double %110, %112
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv155
  store double %113, double* %114, align 8
  %indvars.iv.next156 = add nsw i64 %indvars.iv155, -1
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next156
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, %113
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv.next156
  %119 = load double, double* %118, align 8
  %120 = fadd double %117, %119
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.next156
  store double %120, double* %121, align 8
  %indvars.iv.next156.1 = add nsw i64 %indvars.iv155, -2
  %122 = icmp sgt i64 %indvars.iv.next156, 1
  br i1 %122, label %.lr.ph144.us, label %._crit_edge128.us

; <label>:123:                                    ; preds = %123, %.ph27
  %store_forwarded33 = phi double [ %load_initial32, %.ph27 ], [ %141, %123 ]
  %store_forwarded30 = phi double [ %load_initial29, %.ph27 ], [ %126, %123 ]
  %indvars.iv152 = phi i64 [ 1, %.ph27 ], [ %indvars.iv.next153, %123 ]
  %124 = fmul double %store_forwarded30, 0xC08F400000000001
  %125 = fadd double %124, 0x409F440000000001
  %126 = fdiv double 0x408F400000000001, %125
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv152
  store double %126, double* %127, align 8
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %80, i64 %indvars.iv152
  %129 = load double, double* %128, align 8
  %130 = fmul double %129, 0xC09F400000000001
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv152
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, 0xC0AF3E0000000001
  %134 = fsub double %133, %130
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next40, i64 %indvars.iv152
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, 0xC09F400000000001
  %138 = fsub double %134, %137
  %139 = fmul double %store_forwarded33, 0xC08F400000000001
  %140 = fsub double %138, %139
  %141 = fdiv double %140, %125
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv152
  store double %141, double* %142, align 8
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next153, 999
  br i1 %exitcond154, label %.lr.ph144.us.preheader.loopexit42, label %123

.lr.ph144.us.preheader.loopexit:                  ; preds = %.ph27.lver.orig
  br label %.lr.ph144.us.preheader

.lr.ph144.us.preheader.loopexit42:                ; preds = %123
  br label %.lr.ph144.us.preheader

.lr.ph144.us.preheader:                           ; preds = %.lr.ph144.us.preheader.loopexit42, %.lr.ph144.us.preheader.loopexit
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv39, i64 999
  store double 1.000000e+00, double* %143, align 8
  br label %.lr.ph144.us

._crit_edge128._crit_edge:                        ; preds = %._crit_edge128.us
  %144 = add nuw nsw i32 %storemerge148, 1
  %exitcond157 = icmp eq i32 %144, 501
  br i1 %exitcond157, label %._crit_edge149, label %.lr.ph137.split.us.preheader

._crit_edge149:                                   ; preds = %._crit_edge128._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge10.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge10.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %6

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge10.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %._crit_edge, label %.._crit_edge_crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
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
