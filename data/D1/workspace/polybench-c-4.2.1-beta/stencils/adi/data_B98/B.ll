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
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array([1000 x double]* %16)
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
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv6 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next7, %._crit_edge.us ]
  %1 = add nuw nsw i64 %indvars.iv6, 1000
  %2 = trunc i64 %1 to i32
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %3 ]
  %4 = trunc i64 %indvars.iv to i32
  %5 = sub nuw nsw i32 %2, %4
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sub nuw nsw i32 %2, %8
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = fdiv <2 x double> %12, <double 1.000000e+03, double 1.000000e+03>
  %14 = bitcast double* %7 to <2 x double>*
  store <2 x double> %13, <2 x double>* %14, align 8
  %exitcond8.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond8.1, label %._crit_edge.us, label %3

._crit_edge.us:                                   ; preds = %3
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond, label %._crit_edge5, label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader4.lr.ph:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge24, %.preheader4.lr.ph
  %.0325 = phi i32 [ 1, %.preheader4.lr.ph ], [ %150, %._crit_edge24 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge9.us, %.preheader4
  %indvar = phi i64 [ 0, %.preheader4 ], [ %4, %._crit_edge9.us ]
  %indvars.iv30 = phi i64 [ 1, %.preheader4 ], [ %indvars.iv.next31, %._crit_edge9.us ]
  %4 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 0
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %2, i64 %4, i64 999
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %3, i64 %4, i64 999
  %5 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 0, i64 %indvars.iv30
  store double 1.000000e+00, double* %5, align 8
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv30, i64 0
  store double 0.000000e+00, double* %6, align 8
  %7 = bitcast double* %5 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv30
  %10 = bitcast [1000 x double]* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = add nsw i64 %indvars.iv30, -1
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %bound0 = icmp ult double* %scevgep, %scevgep48
  %bound1 = icmp ult double* %scevgep46, %scevgep44
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %12 = add nsw i64 %indvars.iv.lver.orig, -1
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv30, i64 %12
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv30, i64 %indvars.iv.lver.orig
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %11
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next31
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv30, i64 %12
  %.rhs.lver.orig = fmul double %14, 0xC09F400000000001
  %19 = fadd double %.rhs.lver.orig, 0x40AF420000000001
  %20 = fdiv double 0x409F400000000001, %19
  store double %20, double* %15, align 8
  %21 = bitcast double* %16 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %23 = fmul <2 x double> %22, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  %26 = fsub double %25, %24
  %27 = load double, double* %17, align 8
  %28 = fmul double %27, 0xC08F400000000001
  %29 = fsub double %26, %28
  %30 = load double, double* %18, align 8
  %31 = fmul double %30, 0xC09F400000000001
  %32 = fsub double %29, %31
  %33 = fdiv double %32, %19
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv30, i64 %indvars.iv.lver.orig
  store double %33, double* %34, align 8
  %exitcond40.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond40.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial52 = load double, double* %scevgep46, align 8
  br label %35

; <label>:35:                                     ; preds = %35, %.ph
  %store_forwarded53 = phi double [ %load_initial52, %.ph ], [ %52, %35 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %40, %35 ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %35 ]
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv30, i64 %indvars.iv
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %11
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv.next31
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %39 = fadd double %.rhs, 0x40AF420000000001
  %40 = fdiv double 0x409F400000000001, %39
  store double %40, double* %36, align 8
  %41 = bitcast double* %37 to <2 x double>*
  %42 = load <2 x double>, <2 x double>* %41, align 8
  %43 = fmul <2 x double> %42, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %44 = extractelement <2 x double> %43, i32 0
  %45 = extractelement <2 x double> %43, i32 1
  %46 = fsub double %45, %44
  %47 = load double, double* %38, align 8
  %48 = fmul double %47, 0xC08F400000000001
  %49 = fsub double %46, %48
  %50 = fmul double %store_forwarded53, 0xC09F400000000001
  %51 = fsub double %49, %50
  %52 = fdiv double %51, %39
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv30, i64 %indvars.iv
  store double %52, double* %53, align 8
  %exitcond40 = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond40, label %._crit_edge.us.loopexit6, label %35

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit6:                         ; preds = %35
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit6, %._crit_edge.us.loopexit
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 999, i64 %indvars.iv30
  store double 1.000000e+00, double* %54, align 8
  br label %.lr.ph8.us

.lr.ph8.us:                                       ; preds = %.lr.ph8.us, %._crit_edge.us
  %indvars.iv28 = phi i64 [ 998, %._crit_edge.us ], [ %indvars.iv.next29.1, %.lr.ph8.us ]
  %55 = phi double [ 1.000000e+00, %._crit_edge.us ], [ %68, %.lr.ph8.us ]
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv30, i64 %indvars.iv28
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %55
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv30, i64 %indvars.iv28
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv30
  store double %61, double* %62, align 8
  %indvars.iv.next29 = add nsw i64 %indvars.iv28, -1
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv30, i64 %indvars.iv.next29
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %61
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv30, i64 %indvars.iv.next29
  %67 = load double, double* %66, align 8
  %68 = fadd double %65, %67
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next29, i64 %indvars.iv30
  store double %68, double* %69, align 8
  %70 = icmp sgt i64 %indvars.iv.next29, 1
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, -2
  br i1 %70, label %.lr.ph8.us, label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.lr.ph8.us
  %exitcond41 = icmp eq i64 %indvars.iv.next31, 999
  br i1 %exitcond41, label %.lver.check68.preheader, label %.lver.check

.lver.check68.preheader:                          ; preds = %._crit_edge9.us
  br label %.lver.check68

.lver.check68:                                    ; preds = %.lver.check68.preheader, %._crit_edge20.us
  %indvar54 = phi i64 [ %71, %._crit_edge20.us ], [ 0, %.lver.check68.preheader ]
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge20.us ], [ 1, %.lver.check68.preheader ]
  %71 = add i64 %indvar54, 1
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %2, i64 %71, i64 0
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %2, i64 %71, i64 999
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %3, i64 %71, i64 0
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %3, i64 %71, i64 999
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv38
  %73 = bitcast [1000 x double]* %72 to double*
  store double 1.000000e+00, double* %73, align 8
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 0
  store double 0.000000e+00, double* %74, align 8
  %75 = bitcast [1000 x double]* %72 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38
  %78 = bitcast [1000 x double]* %77 to i64*
  store i64 %76, i64* %78, align 8
  %79 = add nsw i64 %indvars.iv38, -1
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %bound064 = icmp ult double* %scevgep56, %scevgep62
  %bound165 = icmp ult double* %scevgep60, %scevgep58
  %memcheck.conflict67 = and i1 %bound064, %bound165
  br i1 %memcheck.conflict67, label %.ph69.lver.orig.preheader, label %.ph69

.ph69.lver.orig.preheader:                        ; preds = %.lver.check68
  br label %.ph69.lver.orig

.ph69.lver.orig:                                  ; preds = %.ph69.lver.orig.preheader, %.ph69.lver.orig
  %indvars.iv32.lver.orig = phi i64 [ %indvars.iv.next33.lver.orig, %.ph69.lver.orig ], [ 1, %.ph69.lver.orig.preheader ]
  %80 = add nsw i64 %indvars.iv32.lver.orig, -1
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %80
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv32.lver.orig
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next39, i64 %indvars.iv32.lver.orig
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %80
  %88 = insertelement <2 x double> undef, double %82, i32 0
  %89 = shufflevector <2 x double> %88, <2 x double> undef, <2 x i32> zeroinitializer
  %90 = fmul <2 x double> %89, <double 0xC08F400000000001, double 0xC08F400000000001>
  %91 = fadd <2 x double> %90, <double 0x409F440000000001, double 0x409F440000000001>
  %92 = extractelement <2 x double> %91, i32 0
  %93 = extractelement <2 x double> %91, i32 1
  %94 = fdiv double 0x408F400000000001, %92
  store double %94, double* %83, align 8
  %95 = load double, double* %84, align 8
  %96 = fmul double %95, 0xC09F400000000001
  %97 = load double, double* %85, align 8
  %98 = fmul double %97, 0xC0AF3E0000000001
  %99 = fsub double %98, %96
  %100 = load double, double* %86, align 8
  %101 = fmul double %100, 0xC09F400000000001
  %102 = fsub double %99, %101
  %103 = load double, double* %87, align 8
  %104 = fmul double %103, 0xC08F400000000001
  %105 = fsub double %102, %104
  %106 = fdiv double %105, %93
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv32.lver.orig
  store double %106, double* %107, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv32.lver.orig, 998
  %indvars.iv.next33.lver.orig = add nuw nsw i64 %indvars.iv32.lver.orig, 1
  br i1 %exitcond.lver.orig, label %._crit_edge16.us.loopexit, label %.ph69.lver.orig

.ph69:                                            ; preds = %.lver.check68
  %load_initial71 = load double, double* %scevgep56, align 8
  %load_initial74 = load double, double* %scevgep60, align 8
  br label %108

; <label>:108:                                    ; preds = %108, %.ph69
  %store_forwarded75 = phi double [ %load_initial74, %.ph69 ], [ %130, %108 ]
  %store_forwarded72 = phi double [ %load_initial71, %.ph69 ], [ %119, %108 ]
  %indvars.iv32 = phi i64 [ 1, %.ph69 ], [ %indvars.iv.next33, %108 ]
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv32
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %79, i64 %indvars.iv32
  %111 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv32
  %112 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next39, i64 %indvars.iv32
  %113 = insertelement <2 x double> undef, double %store_forwarded72, i32 0
  %114 = shufflevector <2 x double> %113, <2 x double> undef, <2 x i32> zeroinitializer
  %115 = fmul <2 x double> %114, <double 0xC08F400000000001, double 0xC08F400000000001>
  %116 = fadd <2 x double> %115, <double 0x409F440000000001, double 0x409F440000000001>
  %117 = extractelement <2 x double> %116, i32 0
  %118 = extractelement <2 x double> %116, i32 1
  %119 = fdiv double 0x408F400000000001, %117
  store double %119, double* %109, align 8
  %120 = load double, double* %110, align 8
  %121 = fmul double %120, 0xC09F400000000001
  %122 = load double, double* %111, align 8
  %123 = fmul double %122, 0xC0AF3E0000000001
  %124 = fsub double %123, %121
  %125 = load double, double* %112, align 8
  %126 = fmul double %125, 0xC09F400000000001
  %127 = fsub double %124, %126
  %128 = fmul double %store_forwarded75, 0xC08F400000000001
  %129 = fsub double %127, %128
  %130 = fdiv double %129, %118
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv32
  store double %130, double* %131, align 8
  %exitcond = icmp eq i64 %indvars.iv32, 998
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  br i1 %exitcond, label %._crit_edge16.us.loopexit5, label %108

._crit_edge16.us.loopexit:                        ; preds = %.ph69.lver.orig
  br label %._crit_edge16.us

._crit_edge16.us.loopexit5:                       ; preds = %108
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit5, %._crit_edge16.us.loopexit
  %132 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv38, i64 999
  store double 1.000000e+00, double* %132, align 8
  br label %.lr.ph19.us

.lr.ph19.us:                                      ; preds = %.lr.ph19.us, %._crit_edge16.us
  %indvars.iv36 = phi i64 [ 998, %._crit_edge16.us ], [ %indvars.iv.next37.1, %.lr.ph19.us ]
  %133 = phi double [ 1.000000e+00, %._crit_edge16.us ], [ %146, %.lr.ph19.us ]
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv36
  %135 = load double, double* %134, align 8
  %136 = fmul double %135, %133
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv36
  %138 = load double, double* %137, align 8
  %139 = fadd double %136, %138
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv36
  store double %139, double* %140, align 8
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, -1
  %141 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.next37
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, %139
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv.next37
  %145 = load double, double* %144, align 8
  %146 = fadd double %143, %145
  %147 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv.next37
  store double %146, double* %147, align 8
  %148 = icmp sgt i64 %indvars.iv.next37, 1
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, -2
  br i1 %148, label %.lr.ph19.us, label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %.lr.ph19.us
  %exitcond42 = icmp eq i64 %indvars.iv.next39, 999
  br i1 %exitcond42, label %._crit_edge24, label %.lver.check68

._crit_edge24:                                    ; preds = %._crit_edge20.us
  %149 = icmp slt i32 %.0325, 500
  %150 = add nuw nsw i32 %.0325, 1
  br i1 %149, label %.preheader4, label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge24
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly) unnamed_addr #0 {
..preheader.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv7 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next8, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv7, 1000
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge6

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %._crit_edge5, label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge.us
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
