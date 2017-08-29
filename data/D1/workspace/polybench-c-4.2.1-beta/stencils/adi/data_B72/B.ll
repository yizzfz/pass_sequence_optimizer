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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv7 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next8, %._crit_edge.us ]
  %2 = add nuw nsw i64 %indvars.iv7, 1000
  %3 = trunc i64 %2 to i32
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %4 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = sub nuw nsw i32 %3, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sub nuw nsw i32 %3, %9
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.000000e+03, double 1.000000e+03>
  %15 = bitcast double* %8 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %exitcond6.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond6.1, label %._crit_edge.us, label %4

._crit_edge.us:                                   ; preds = %4
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #0 {
.preheader4.lr.ph:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %153, %._crit_edge22 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge9.us, %.preheader4
  %indvar = phi i64 [ 0, %.preheader4 ], [ %indvar.next, %._crit_edge9.us ]
  %indvars.iv30 = phi i64 [ 1, %.preheader4 ], [ %indvars.iv.next31, %._crit_edge9.us ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep42 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv30
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv30, -1
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %bound0 = icmp ult double* %scevgep, %scevgep46
  %bound1 = icmp ult double* %scevgep44, %scevgep42
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %15 = add nsw i64 %indvars.iv.lver.orig, -1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %15
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv.lver.orig
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %14
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next31
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %15
  %.rhs.lver.orig = fmul double %17, 0xC09F400000000001
  %22 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %23 = fdiv double 0x409F400000000001, %22
  store double %23, double* %18, align 8
  %24 = bitcast double* %19 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = fmul <2 x double> %25, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  %29 = fsub double %28, %27
  %30 = load double, double* %20, align 8
  %31 = fmul double %30, 0xC08F400000000001
  %32 = fsub double %29, %31
  %33 = load double, double* %21, align 8
  %34 = fmul double %33, 0xC09F400000000001
  %35 = fsub double %32, %34
  %36 = fdiv double %35, %22
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv.lver.orig
  store double %36, double* %37, align 8
  %exitcond27.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond27.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep48, align 8
  %load_initial50 = load double, double* %scevgep49, align 8
  br label %54

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond = icmp eq i64 %indvars.iv.next31, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.lver.check66.preheader, label %.lver.check

.lver.check66.preheader:                          ; preds = %._crit_edge9.us
  br label %.lver.check66

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %._crit_edge.us
  %indvars.iv28 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next29.1, %.lr.ph8.us ]
  %38 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %51, %.lr.ph8.us ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv28
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %38
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv28
  %43 = load double, double* %42, align 8
  %44 = fadd double %41, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv30
  store double %44, double* %45, align 8
  %indvars.iv.next29 = add nsw i64 %indvars.iv28, -1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv.next29
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %44
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv.next29
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next29, i64 %indvars.iv30
  store double %51, double* %52, align 8
  %53 = icmp sgt i64 %indvars.iv.next29, 1
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, -2
  br i1 %53, label %.lr.ph8.us, label %._crit_edge9.us

; <label>:54:                                     ; preds = %54, %.ph
  %store_forwarded51 = phi double [ %load_initial50, %.ph ], [ %71, %54 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %59, %54 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %54 ]
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv30, i64 %indvars.iv
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %14
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next31
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %58 = fadd double %.rhs, 0x40AF420000000001
  %59 = fdiv double 0x409F400000000001, %58
  store double %59, double* %55, align 8
  %60 = bitcast double* %56 to <2 x double>*
  %61 = load <2 x double>, <2 x double>* %60, align 8
  %62 = fmul <2 x double> %61, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %63 = extractelement <2 x double> %62, i32 0
  %64 = extractelement <2 x double> %62, i32 1
  %65 = fsub double %64, %63
  %66 = load double, double* %57, align 8
  %67 = fmul double %66, 0xC08F400000000001
  %68 = fsub double %65, %67
  %69 = fmul double %store_forwarded51, 0xC09F400000000001
  %70 = fsub double %68, %69
  %71 = fdiv double %70, %58
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv30, i64 %indvars.iv
  store double %71, double* %72, align 8
  %exitcond27 = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond27, label %._crit_edge.us.loopexit75, label %54

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit75:                        ; preds = %54
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit75, %._crit_edge.us.loopexit
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv30
  store double 1.000000e+00, double* %73, align 8
  br label %.lr.ph8.us

.lver.check66:                                    ; preds = %.lver.check66.preheader, %._crit_edge19.us
  %indvar52 = phi i64 [ %indvar.next53, %._crit_edge19.us ], [ 0, %.lver.check66.preheader ]
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge19.us ], [ 1, %.lver.check66.preheader ]
  %74 = add i64 %indvar52, 1
  %75 = add i64 %indvar52, 1
  %scevgep54 = getelementptr [1000 x double], [1000 x double]* %4, i64 %75, i64 0
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %4, i64 %75, i64 999
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %5, i64 %75, i64 0
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %5, i64 %75, i64 999
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 0
  store double 1.000000e+00, double* %76, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 0
  store double 0.000000e+00, double* %77, align 8
  %78 = bitcast double* %76 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38
  %81 = bitcast [1000 x double]* %80 to i64*
  store i64 %79, i64* %81, align 8
  %82 = add nsw i64 %indvars.iv38, -1
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %bound062 = icmp ult double* %scevgep54, %scevgep60
  %bound163 = icmp ult double* %scevgep58, %scevgep56
  %memcheck.conflict65 = and i1 %bound062, %bound163
  br i1 %memcheck.conflict65, label %.ph67.lver.orig.preheader, label %.ph67

.ph67.lver.orig.preheader:                        ; preds = %.lver.check66
  br label %.ph67.lver.orig

.ph67.lver.orig:                                  ; preds = %.ph67.lver.orig.preheader, %.ph67.lver.orig
  %indvars.iv32.lver.orig = phi i64 [ %indvars.iv.next33.lver.orig, %.ph67.lver.orig ], [ 1, %.ph67.lver.orig.preheader ]
  %83 = add nsw i64 %indvars.iv32.lver.orig, -1
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %83
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %82, i64 %indvars.iv32.lver.orig
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next39, i64 %indvars.iv32.lver.orig
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %83
  %91 = insertelement <2 x double> undef, double %85, i32 0
  %92 = shufflevector <2 x double> %91, <2 x double> undef, <2 x i32> zeroinitializer
  %93 = fmul <2 x double> %92, <double 0xC08F400000000001, double 0xC08F400000000001>
  %94 = fadd <2 x double> %93, <double 0x409F440000000001, double 0x409F440000000001>
  %95 = extractelement <2 x double> %94, i32 0
  %96 = extractelement <2 x double> %94, i32 1
  %97 = fdiv double 0x408F400000000001, %95
  store double %97, double* %86, align 8
  %98 = load double, double* %87, align 8
  %99 = fmul double %98, 0xC09F400000000001
  %100 = load double, double* %88, align 8
  %101 = fmul double %100, 0xC0AF3E0000000001
  %102 = fsub double %101, %99
  %103 = load double, double* %89, align 8
  %104 = fmul double %103, 0xC09F400000000001
  %105 = fsub double %102, %104
  %106 = load double, double* %90, align 8
  %107 = fmul double %106, 0xC08F400000000001
  %108 = fsub double %105, %107
  %109 = fdiv double %108, %96
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  store double %109, double* %110, align 8
  %exitcond35.lver.orig = icmp eq i64 %indvars.iv32.lver.orig, 998
  %indvars.iv.next33.lver.orig = add nuw nsw i64 %indvars.iv32.lver.orig, 1
  br i1 %exitcond35.lver.orig, label %._crit_edge15.us.loopexit, label %.ph67.lver.orig

.ph67:                                            ; preds = %.lver.check66
  %scevgep71 = getelementptr [1000 x double], [1000 x double]* %5, i64 %74, i64 0
  %scevgep68 = getelementptr [1000 x double], [1000 x double]* %4, i64 %74, i64 0
  %load_initial69 = load double, double* %scevgep68, align 8
  %load_initial72 = load double, double* %scevgep71, align 8
  br label %127

._crit_edge19.us:                                 ; preds = %.lr.ph18.us
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 999
  %indvar.next53 = add i64 %indvar52, 1
  br i1 %exitcond40, label %._crit_edge22, label %.lver.check66

.lr.ph18.us:                                      ; preds = %.lr.ph18.us, %._crit_edge15.us
  %indvars.iv36 = phi i64 [ 998, %._crit_edge15.us ], [ %indvars.iv.next37.1, %.lr.ph18.us ]
  %111 = phi double [ 1.000000e+00, %._crit_edge15.us ], [ %124, %.lr.ph18.us ]
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv36
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, %111
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv36
  %116 = load double, double* %115, align 8
  %117 = fadd double %114, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv36
  store double %117, double* %118, align 8
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, -1
  %119 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next37
  %120 = load double, double* %119, align 8
  %121 = fmul double %120, %117
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv.next37
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.next37
  store double %124, double* %125, align 8
  %126 = icmp sgt i64 %indvars.iv.next37, 1
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, -2
  br i1 %126, label %.lr.ph18.us, label %._crit_edge19.us

; <label>:127:                                    ; preds = %127, %.ph67
  %store_forwarded73 = phi double [ %load_initial72, %.ph67 ], [ %149, %127 ]
  %store_forwarded70 = phi double [ %load_initial69, %.ph67 ], [ %138, %127 ]
  %indvars.iv32 = phi i64 [ 1, %.ph67 ], [ %indvars.iv.next33, %127 ]
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv32
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %82, i64 %indvars.iv32
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv32
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next39, i64 %indvars.iv32
  %132 = insertelement <2 x double> undef, double %store_forwarded70, i32 0
  %133 = shufflevector <2 x double> %132, <2 x double> undef, <2 x i32> zeroinitializer
  %134 = fmul <2 x double> %133, <double 0xC08F400000000001, double 0xC08F400000000001>
  %135 = fadd <2 x double> %134, <double 0x409F440000000001, double 0x409F440000000001>
  %136 = extractelement <2 x double> %135, i32 0
  %137 = extractelement <2 x double> %135, i32 1
  %138 = fdiv double 0x408F400000000001, %136
  store double %138, double* %128, align 8
  %139 = load double, double* %129, align 8
  %140 = fmul double %139, 0xC09F400000000001
  %141 = load double, double* %130, align 8
  %142 = fmul double %141, 0xC0AF3E0000000001
  %143 = fsub double %142, %140
  %144 = load double, double* %131, align 8
  %145 = fmul double %144, 0xC09F400000000001
  %146 = fsub double %143, %145
  %147 = fmul double %store_forwarded73, 0xC08F400000000001
  %148 = fsub double %146, %147
  %149 = fdiv double %148, %137
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv32
  store double %149, double* %150, align 8
  %exitcond35 = icmp eq i64 %indvars.iv32, 998
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  br i1 %exitcond35, label %._crit_edge15.us.loopexit74, label %127

._crit_edge15.us.loopexit:                        ; preds = %.ph67.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit74:                      ; preds = %127
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit74, %._crit_edge15.us.loopexit
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 999
  store double 1.000000e+00, double* %151, align 8
  br label %.lr.ph18.us

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %152 = icmp slt i32 %.0323, 500
  %153 = add nuw nsw i32 %.0323, 1
  br i1 %152, label %.preheader4, label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv6, 1000
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge5

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
