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
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %16)
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
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader.preheader.us.preheader:
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv913.us = phi i64 [ %indvars.iv.next10.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %2 = add nuw nsw i64 %indvars.iv913.us, 1000
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv12.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us ], [ 0, %.preheader.us.preheader ]
  %3 = sub i64 %2, %indvars.iv12.us
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv913.us, i64 %indvars.iv12.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv12.us, 1
  %7 = sub i64 %2, %indvars.iv.next.us
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %5, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fdiv <2 x double> %11, <double 1.000000e+03, double 1.000000e+03>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv12.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 1000
  br i1 %exitcond.us.1, label %.preheader._crit_edge.us, label %.preheader.us

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv913.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond, label %._crit_edge, label %.preheader.us.preheader

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader128.preheader.lr.ph:
  br label %.lver.check.preheader

.lver.check.preheader:                            ; preds = %.preheader128.preheader.lr.ph, %.preheader._crit_edge
  %storemerge164 = phi i32 [ 1, %.preheader128.preheader.lr.ph ], [ %158, %.preheader._crit_edge ]
  br label %.lver.check

.lver.check:                                      ; preds = %.lver.check.preheader, %.preheader128.us
  %indvar = phi i64 [ %indvar.next, %.preheader128.us ], [ 0, %.lver.check.preheader ]
  %indvars.iv131147.us = phi i64 [ %15, %.preheader128.us ], [ 1, %.lver.check.preheader ]
  %6 = add nuw nsw i64 %indvar, 1
  %7 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %scevgep175 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 999
  %scevgep177 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep179 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 999
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv131147.us
  store double 1.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv131147.us, i64 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast double* %8 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv131147.us
  %13 = bitcast [1000 x double]* %12 to i64*
  store i64 %11, i64* %13, align 8
  %14 = add nsw i64 %indvars.iv131147.us, -1
  %15 = add nuw nsw i64 %indvars.iv131147.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep179
  %bound1 = icmp ult double* %scevgep177, %scevgep175
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig.preheader, %.ph.lver.orig
  %indvars.iv142.us.lver.orig = phi i64 [ %indvars.iv.next.us.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %16 = add nsw i64 %indvars.iv142.us.lver.orig, -1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv131147.us, i64 %16
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv131147.us, i64 %indvars.iv142.us.lver.orig
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv142.us.lver.orig, i64 %14
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv142.us.lver.orig, i64 %15
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv131147.us, i64 %16
  %.rhs208 = fmul double %18, 0xC09F400000000001
  %23 = fadd double %.rhs208, 0x40AF420000000001
  %24 = fdiv double 0x409F400000000001, %23
  store double %24, double* %19, align 8
  %25 = bitcast double* %20 to <2 x double>*
  %26 = load <2 x double>, <2 x double>* %25, align 8
  %27 = fmul <2 x double> %26, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fsub double %29, %28
  %31 = load double, double* %21, align 8
  %32 = fmul double %31, 0xC08F400000000001
  %33 = fsub double %30, %32
  %34 = load double, double* %22, align 8
  %35 = fmul double %34, 0xC09F400000000001
  %36 = fsub double %33, %35
  %37 = fdiv double %36, %23
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv131147.us, i64 %indvars.iv142.us.lver.orig
  store double %37, double* %38, align 8
  %indvars.iv.next.us.lver.orig = add nuw nsw i64 %indvars.iv142.us.lver.orig, 1
  %exitcond.us.lver.orig = icmp eq i64 %indvars.iv.next.us.lver.orig, 999
  br i1 %exitcond.us.lver.orig, label %.lr.ph145.us.preheader.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep182 = getelementptr [1000 x double], [1000 x double]* %5, i64 %6, i64 0
  %scevgep181 = getelementptr [1000 x double], [1000 x double]* %4, i64 %6, i64 0
  %load_initial = load double, double* %scevgep181, align 8
  %load_initial183 = load double, double* %scevgep182, align 8
  br label %57

.preheader128.us:                                 ; preds = %.lr.ph145.us
  %exitcond = icmp eq i64 %15, 999
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond, label %.lver.check199.preheader, label %.lver.check

.lr.ph145.us:                                     ; preds = %.lr.ph145.us, %.lr.ph145.us.preheader
  %indvars.iv129143.us = phi i64 [ 998, %.lr.ph145.us.preheader ], [ %indvars.iv.next130.us.1, %.lr.ph145.us ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv131147.us, i64 %indvars.iv129143.us
  %40 = load double, double* %39, align 8
  %41 = or i64 %indvars.iv129143.us, 1
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %41, i64 %indvars.iv131147.us
  %43 = load double, double* %42, align 8
  %44 = fmul double %40, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv131147.us, i64 %indvars.iv129143.us
  %46 = load double, double* %45, align 8
  %47 = fadd double %44, %46
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv129143.us, i64 %indvars.iv131147.us
  store double %47, double* %48, align 8
  %indvars.iv.next130.us = add nsw i64 %indvars.iv129143.us, -1
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv131147.us, i64 %indvars.iv.next130.us
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %47
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv131147.us, i64 %indvars.iv.next130.us
  %53 = load double, double* %52, align 8
  %54 = fadd double %51, %53
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next130.us, i64 %indvars.iv131147.us
  store double %54, double* %55, align 8
  %indvars.iv.next130.us.1 = add nsw i64 %indvars.iv129143.us, -2
  %56 = icmp sgt i64 %indvars.iv.next130.us, 1
  br i1 %56, label %.lr.ph145.us, label %.preheader128.us

; <label>:57:                                     ; preds = %57, %.ph
  %store_forwarded184 = phi double [ %load_initial183, %.ph ], [ %74, %57 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %62, %57 ]
  %indvars.iv142.us = phi i64 [ 1, %.ph ], [ %indvars.iv.next.us, %57 ]
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv131147.us, i64 %indvars.iv142.us
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv142.us, i64 %14
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv142.us, i64 %15
  %.rhs = fmul double %store_forwarded, 0xC09F400000000001
  %61 = fadd double %.rhs, 0x40AF420000000001
  %62 = fdiv double 0x409F400000000001, %61
  store double %62, double* %58, align 8
  %63 = bitcast double* %59 to <2 x double>*
  %64 = load <2 x double>, <2 x double>* %63, align 8
  %65 = fmul <2 x double> %64, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %66 = extractelement <2 x double> %65, i32 0
  %67 = extractelement <2 x double> %65, i32 1
  %68 = fsub double %67, %66
  %69 = load double, double* %60, align 8
  %70 = fmul double %69, 0xC08F400000000001
  %71 = fsub double %68, %70
  %72 = fmul double %store_forwarded184, 0xC09F400000000001
  %73 = fsub double %71, %72
  %74 = fdiv double %73, %61
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv131147.us, i64 %indvars.iv142.us
  store double %74, double* %75, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv142.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 999
  br i1 %exitcond.us, label %.lr.ph145.us.preheader.loopexit214, label %57

.lr.ph145.us.preheader.loopexit:                  ; preds = %.ph.lver.orig
  br label %.lr.ph145.us.preheader

.lr.ph145.us.preheader.loopexit214:               ; preds = %57
  br label %.lr.ph145.us.preheader

.lr.ph145.us.preheader:                           ; preds = %.lr.ph145.us.preheader.loopexit214, %.lr.ph145.us.preheader.loopexit
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv131147.us
  store double 1.000000e+00, double* %76, align 8
  br label %.lr.ph145.us

.lver.check199.preheader:                         ; preds = %.preheader128.us
  br label %.lver.check199

.lver.check199:                                   ; preds = %.lver.check199.preheader, %.preheader.us
  %indvar185 = phi i64 [ %indvar.next186, %.preheader.us ], [ 0, %.lver.check199.preheader ]
  %indvars.iv139160.us = phi i64 [ %86, %.preheader.us ], [ 1, %.lver.check199.preheader ]
  %77 = add nuw nsw i64 %indvar185, 1
  %78 = add nuw nsw i64 %indvar185, 1
  %scevgep187 = getelementptr [1000 x double], [1000 x double]* %4, i64 %78, i64 0
  %scevgep189 = getelementptr [1000 x double], [1000 x double]* %4, i64 %78, i64 999
  %scevgep191 = getelementptr [1000 x double], [1000 x double]* %5, i64 %78, i64 0
  %scevgep193 = getelementptr [1000 x double], [1000 x double]* %5, i64 %78, i64 999
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv139160.us, i64 0
  store double 1.000000e+00, double* %79, align 8
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv139160.us, i64 0
  store double 0.000000e+00, double* %80, align 8
  %81 = bitcast double* %79 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv139160.us
  %84 = bitcast [1000 x double]* %83 to i64*
  store i64 %82, i64* %84, align 8
  %85 = add nsw i64 %indvars.iv139160.us, -1
  %86 = add nuw nsw i64 %indvars.iv139160.us, 1
  %bound0195 = icmp ult double* %scevgep187, %scevgep193
  %bound1196 = icmp ult double* %scevgep191, %scevgep189
  %memcheck.conflict198 = and i1 %bound0195, %bound1196
  br i1 %memcheck.conflict198, label %.ph200.lver.orig.preheader, label %.ph200

.ph200.lver.orig.preheader:                       ; preds = %.lver.check199
  br label %.ph200.lver.orig

.ph200.lver.orig:                                 ; preds = %.ph200.lver.orig.preheader, %.ph200.lver.orig
  %indvars.iv133152.us.lver.orig = phi i64 [ %indvars.iv.next134.us.lver.orig, %.ph200.lver.orig ], [ 1, %.ph200.lver.orig.preheader ]
  %87 = add nsw i64 %indvars.iv133152.us.lver.orig, -1
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv139160.us, i64 %87
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv139160.us, i64 %indvars.iv133152.us.lver.orig
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %85, i64 %indvars.iv133152.us.lver.orig
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv139160.us, i64 %indvars.iv133152.us.lver.orig
  %93 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %86, i64 %indvars.iv133152.us.lver.orig
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv139160.us, i64 %87
  %95 = insertelement <2 x double> undef, double %89, i32 0
  %96 = shufflevector <2 x double> %95, <2 x double> undef, <2 x i32> zeroinitializer
  %97 = fmul <2 x double> %96, <double 0xC08F400000000001, double 0xC08F400000000001>
  %98 = fadd <2 x double> %97, <double 0x409F440000000001, double 0x409F440000000001>
  %99 = extractelement <2 x double> %98, i32 0
  %100 = extractelement <2 x double> %98, i32 1
  %101 = fdiv double 0x408F400000000001, %99
  store double %101, double* %90, align 8
  %102 = load double, double* %91, align 8
  %103 = fmul double %102, 0xC09F400000000001
  %104 = load double, double* %92, align 8
  %105 = fmul double %104, 0xC0AF3E0000000001
  %106 = fsub double %105, %103
  %107 = load double, double* %93, align 8
  %108 = fmul double %107, 0xC09F400000000001
  %109 = fsub double %106, %108
  %110 = load double, double* %94, align 8
  %111 = fmul double %110, 0xC08F400000000001
  %112 = fsub double %109, %111
  %113 = fdiv double %112, %100
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv139160.us, i64 %indvars.iv133152.us.lver.orig
  store double %113, double* %114, align 8
  %indvars.iv.next134.us.lver.orig = add nuw nsw i64 %indvars.iv133152.us.lver.orig, 1
  %exitcond136.us.lver.orig = icmp eq i64 %indvars.iv.next134.us.lver.orig, 999
  br i1 %exitcond136.us.lver.orig, label %.lr.ph158.us.preheader.loopexit, label %.ph200.lver.orig

.ph200:                                           ; preds = %.lver.check199
  %scevgep204 = getelementptr [1000 x double], [1000 x double]* %5, i64 %77, i64 0
  %scevgep201 = getelementptr [1000 x double], [1000 x double]* %4, i64 %77, i64 0
  %load_initial202 = load double, double* %scevgep201, align 8
  %load_initial205 = load double, double* %scevgep204, align 8
  br label %133

.preheader.us:                                    ; preds = %.lr.ph158.us
  %exitcond169 = icmp eq i64 %86, 999
  %indvar.next186 = add nuw nsw i64 %indvar185, 1
  br i1 %exitcond169, label %.preheader._crit_edge, label %.lver.check199

.lr.ph158.us:                                     ; preds = %.lr.ph158.us, %.lr.ph158.us.preheader
  %indvars.iv137156.us = phi i64 [ 998, %.lr.ph158.us.preheader ], [ %indvars.iv.next138.us.1, %.lr.ph158.us ]
  %115 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv139160.us, i64 %indvars.iv137156.us
  %116 = load double, double* %115, align 8
  %117 = or i64 %indvars.iv137156.us, 1
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv139160.us, i64 %117
  %119 = load double, double* %118, align 8
  %120 = fmul double %116, %119
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv139160.us, i64 %indvars.iv137156.us
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv139160.us, i64 %indvars.iv137156.us
  store double %123, double* %124, align 8
  %indvars.iv.next138.us = add nsw i64 %indvars.iv137156.us, -1
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv139160.us, i64 %indvars.iv.next138.us
  %126 = load double, double* %125, align 8
  %127 = fmul double %126, %123
  %128 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv139160.us, i64 %indvars.iv.next138.us
  %129 = load double, double* %128, align 8
  %130 = fadd double %127, %129
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv139160.us, i64 %indvars.iv.next138.us
  store double %130, double* %131, align 8
  %indvars.iv.next138.us.1 = add nsw i64 %indvars.iv137156.us, -2
  %132 = icmp sgt i64 %indvars.iv.next138.us, 1
  br i1 %132, label %.lr.ph158.us, label %.preheader.us

; <label>:133:                                    ; preds = %133, %.ph200
  %store_forwarded206 = phi double [ %load_initial205, %.ph200 ], [ %155, %133 ]
  %store_forwarded203 = phi double [ %load_initial202, %.ph200 ], [ %144, %133 ]
  %indvars.iv133152.us = phi i64 [ 1, %.ph200 ], [ %indvars.iv.next134.us, %133 ]
  %134 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv139160.us, i64 %indvars.iv133152.us
  %135 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %85, i64 %indvars.iv133152.us
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv139160.us, i64 %indvars.iv133152.us
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %86, i64 %indvars.iv133152.us
  %138 = insertelement <2 x double> undef, double %store_forwarded203, i32 0
  %139 = shufflevector <2 x double> %138, <2 x double> undef, <2 x i32> zeroinitializer
  %140 = fmul <2 x double> %139, <double 0xC08F400000000001, double 0xC08F400000000001>
  %141 = fadd <2 x double> %140, <double 0x409F440000000001, double 0x409F440000000001>
  %142 = extractelement <2 x double> %141, i32 0
  %143 = extractelement <2 x double> %141, i32 1
  %144 = fdiv double 0x408F400000000001, %142
  store double %144, double* %134, align 8
  %145 = load double, double* %135, align 8
  %146 = fmul double %145, 0xC09F400000000001
  %147 = load double, double* %136, align 8
  %148 = fmul double %147, 0xC0AF3E0000000001
  %149 = fsub double %148, %146
  %150 = load double, double* %137, align 8
  %151 = fmul double %150, 0xC09F400000000001
  %152 = fsub double %149, %151
  %153 = fmul double %store_forwarded206, 0xC08F400000000001
  %154 = fsub double %152, %153
  %155 = fdiv double %154, %143
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv139160.us, i64 %indvars.iv133152.us
  store double %155, double* %156, align 8
  %indvars.iv.next134.us = add nuw nsw i64 %indvars.iv133152.us, 1
  %exitcond136.us = icmp eq i64 %indvars.iv.next134.us, 999
  br i1 %exitcond136.us, label %.lr.ph158.us.preheader.loopexit213, label %133

.lr.ph158.us.preheader.loopexit:                  ; preds = %.ph200.lver.orig
  br label %.lr.ph158.us.preheader

.lr.ph158.us.preheader.loopexit213:               ; preds = %133
  br label %.lr.ph158.us.preheader

.lr.ph158.us.preheader:                           ; preds = %.lr.ph158.us.preheader.loopexit213, %.lr.ph158.us.preheader.loopexit
  %157 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv139160.us, i64 999
  store double 1.000000e+00, double* %157, align 8
  br label %.lr.ph158.us

.preheader._crit_edge:                            ; preds = %.preheader.us
  %158 = add nuw nsw i32 %storemerge164, 1
  %exitcond171 = icmp eq i32 %storemerge164, 500
  br i1 %exitcond171, label %._crit_edge165, label %.lver.check.preheader

._crit_edge165:                                   ; preds = %.preheader._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv913.us = phi i64 [ %indvars.iv.next10.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %6 = mul nsw i64 %indvars.iv913.us, 1000
  br label %7

; <label>:7:                                      ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv12.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us ]
  %8 = add nsw i64 %indvars.iv12.us, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.preheader.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv913.us, i64 %indvars.iv12.us
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv12.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1000
  br i1 %exitcond.us, label %.preheader._crit_edge.us, label %7

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv913.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond, label %._crit_edge, label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
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
