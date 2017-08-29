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
  %3 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
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
  call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]*) unnamed_addr #2 {
.preheader.lr.ph:
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv10 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next11, %._crit_edge.us ]
  %2 = trunc i64 %indvars.iv10 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ 0, %.preheader.us ]
  %3 = trunc i64 %indvars.iv to i32
  %4 = sub i32 1000, %3
  %5 = add i32 %4, %2
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv
  %8 = trunc i64 %indvars.iv to i32
  %9 = or i32 %8, 1
  %10 = sub i32 1000, %9
  %11 = add i32 %10, %2
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %6, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.000000e+03, double 1.000000e+03>
  %16 = bitcast double* %7 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]*, [1000 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
.preheader8.lr.ph:
  br label %.preheader8

.preheader8:                                      ; preds = %._crit_edge40, %.preheader8.lr.ph
  %6 = phi i32 [ 1, %.preheader8.lr.ph ], [ %153, %._crit_edge40 ]
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge16.us, %.preheader8
  %indvar = phi i64 [ 0, %.preheader8 ], [ %indvar.next, %._crit_edge16.us ]
  %indvars.iv64 = phi i64 [ 1, %.preheader8 ], [ %16, %._crit_edge16.us ]
  %7 = add nuw nsw i64 %indvar, 1
  %8 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 0
  %scevgep94 = getelementptr [1000 x double], [1000 x double]* %4, i64 %8, i64 999
  %scevgep96 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 0
  %scevgep98 = getelementptr [1000 x double], [1000 x double]* %5, i64 %8, i64 999
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv64
  store double 1.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 0
  store double 0.000000e+00, double* %10, align 8
  %11 = bitcast double* %9 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64
  %14 = bitcast [1000 x double]* %13 to i64*
  store i64 %12, i64* %14, align 8
  %15 = add nsw i64 %indvars.iv64, -1
  %16 = add nuw nsw i64 %indvars.iv64, 1
  %bound0 = icmp ult double* %scevgep, %scevgep98
  %bound1 = icmp ult double* %scevgep96, %scevgep94
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig, %.ph.lver.orig.preheader
  %indvars.iv60.lver.orig = phi i64 [ %indvars.iv.next61.lver.orig, %.ph.lver.orig ], [ 1, %.ph.lver.orig.preheader ]
  %17 = add nsw i64 %indvars.iv60.lver.orig, -1
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %17
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, 0xC09F400000000001
  %21 = fadd double %20, 0x40AF420000000001
  %22 = fdiv double 0x409F400000000001, %21
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv60.lver.orig
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv60.lver.orig, i64 %15
  %25 = bitcast double* %24 to <2 x double>*
  %26 = load <2 x double>, <2 x double>* %25, align 8
  %27 = fmul <2 x double> %26, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fsub double %29, %28
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv60.lver.orig, i64 %16
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, 0xC08F400000000001
  %34 = fsub double %30, %33
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %17
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, 0xC09F400000000001
  %38 = fsub double %34, %37
  %39 = fdiv double %38, %21
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv60.lver.orig
  store double %39, double* %40, align 8
  %indvars.iv.next61.lver.orig = add nuw nsw i64 %indvars.iv60.lver.orig, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next61.lver.orig, 999
  br i1 %exitcond128, label %._crit_edge.us.loopexit, label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep101 = getelementptr [1000 x double], [1000 x double]* %5, i64 %7, i64 0
  %scevgep100 = getelementptr [1000 x double], [1000 x double]* %4, i64 %7, i64 0
  %load_initial = load double, double* %scevgep100, align 8
  %load_initial102 = load double, double* %scevgep101, align 8
  br label %59

._crit_edge16.us:                                 ; preds = %.lr.ph15.us.new
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond129 = icmp eq i64 %indvar.next, 998
  br i1 %exitcond129, label %.lver.check118.preheader, label %.lver.check

.lver.check118.preheader:                         ; preds = %._crit_edge16.us
  br label %.lver.check118

.lr.ph15.us.new:                                  ; preds = %._crit_edge.us, %.lr.ph15.us.new
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %.lr.ph15.us.new ], [ 998, %._crit_edge.us ]
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv62
  %42 = load double, double* %41, align 8
  %43 = or i64 %indvars.iv62, 1
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %43, i64 %indvars.iv64
  %45 = load double, double* %44, align 8
  %46 = fmul double %42, %45
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv62
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv64
  store double %49, double* %50, align 8
  %indvars.iv.next63 = add nsw i64 %indvars.iv62, -1
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv.next63
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %49
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv.next63
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next63, i64 %indvars.iv64
  store double %56, double* %57, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, -2
  %58 = icmp sgt i64 %indvars.iv.next63, 1
  br i1 %58, label %.lr.ph15.us.new, label %._crit_edge16.us

; <label>:59:                                     ; preds = %59, %.ph
  %store_forwarded103 = phi double [ %load_initial102, %.ph ], [ %77, %59 ]
  %store_forwarded = phi double [ %load_initial, %.ph ], [ %62, %59 ]
  %indvars.iv60 = phi i64 [ 1, %.ph ], [ %indvars.iv.next61, %59 ]
  %60 = fmul double %store_forwarded, 0xC09F400000000001
  %61 = fadd double %60, 0x40AF420000000001
  %62 = fdiv double 0x409F400000000001, %61
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv60
  store double %62, double* %63, align 8
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv60, i64 %15
  %65 = bitcast double* %64 to <2 x double>*
  %66 = load <2 x double>, <2 x double>* %65, align 8
  %67 = fmul <2 x double> %66, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %70 = fsub double %69, %68
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv60, i64 %16
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, 0xC08F400000000001
  %74 = fsub double %70, %73
  %75 = fmul double %store_forwarded103, 0xC09F400000000001
  %76 = fsub double %74, %75
  %77 = fdiv double %76, %61
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv60
  store double %77, double* %78, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond = icmp eq i64 %indvars.iv.next61, 999
  br i1 %exitcond, label %._crit_edge.us.loopexit127, label %59

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit127:                       ; preds = %59
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit127, %._crit_edge.us.loopexit
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 999, i64 %indvars.iv64
  store double 1.000000e+00, double* %79, align 8
  br label %.lr.ph15.us.new

.lver.check118:                                   ; preds = %._crit_edge35.us, %.lver.check118.preheader
  %indvar104 = phi i64 [ %indvar.next105, %._crit_edge35.us ], [ 0, %.lver.check118.preheader ]
  %indvars.iv74 = phi i64 [ %89, %._crit_edge35.us ], [ 1, %.lver.check118.preheader ]
  %80 = add nuw nsw i64 %indvar104, 1
  %81 = add nuw nsw i64 %indvar104, 1
  %scevgep106 = getelementptr [1000 x double], [1000 x double]* %4, i64 %81, i64 0
  %scevgep108 = getelementptr [1000 x double], [1000 x double]* %4, i64 %81, i64 999
  %scevgep110 = getelementptr [1000 x double], [1000 x double]* %5, i64 %81, i64 0
  %scevgep112 = getelementptr [1000 x double], [1000 x double]* %5, i64 %81, i64 999
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 0
  store double 1.000000e+00, double* %82, align 8
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 0
  store double 0.000000e+00, double* %83, align 8
  %84 = bitcast double* %82 to i64*
  %85 = load i64, i64* %84, align 8
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74
  %87 = bitcast [1000 x double]* %86 to i64*
  store i64 %85, i64* %87, align 8
  %88 = add nsw i64 %indvars.iv74, -1
  %89 = add nuw nsw i64 %indvars.iv74, 1
  %bound0114 = icmp ult double* %scevgep106, %scevgep112
  %bound1115 = icmp ult double* %scevgep110, %scevgep108
  %memcheck.conflict117 = and i1 %bound0114, %bound1115
  br i1 %memcheck.conflict117, label %.ph119.lver.orig.preheader, label %.ph119

.ph119.lver.orig.preheader:                       ; preds = %.lver.check118
  br label %.ph119.lver.orig

.ph119.lver.orig:                                 ; preds = %.ph119.lver.orig, %.ph119.lver.orig.preheader
  %indvars.iv70.lver.orig = phi i64 [ %indvars.iv.next71.lver.orig, %.ph119.lver.orig ], [ 1, %.ph119.lver.orig.preheader ]
  %90 = add nsw i64 %indvars.iv70.lver.orig, -1
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %90
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, 0xC08F400000000001
  %94 = fadd double %93, 0x409F440000000001
  %95 = fdiv double 0x408F400000000001, %94
  %96 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv70.lver.orig
  store double %95, double* %96, align 8
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %88, i64 %indvars.iv70.lver.orig
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, 0xC09F400000000001
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv74, i64 %indvars.iv70.lver.orig
  %101 = load double, double* %100, align 8
  %102 = fmul double %101, 0xC0AF3E0000000001
  %103 = fsub double %102, %99
  %104 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %89, i64 %indvars.iv70.lver.orig
  %105 = load double, double* %104, align 8
  %106 = fmul double %105, 0xC09F400000000001
  %107 = fsub double %103, %106
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %90
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, 0xC08F400000000001
  %111 = fsub double %107, %110
  %112 = fdiv double %111, %94
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv70.lver.orig
  store double %112, double* %113, align 8
  %indvars.iv.next71.lver.orig = add nuw nsw i64 %indvars.iv70.lver.orig, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next71.lver.orig, 999
  br i1 %exitcond131, label %._crit_edge29.us.loopexit, label %.ph119.lver.orig

.ph119:                                           ; preds = %.lver.check118
  %scevgep123 = getelementptr [1000 x double], [1000 x double]* %5, i64 %80, i64 0
  %scevgep120 = getelementptr [1000 x double], [1000 x double]* %4, i64 %80, i64 0
  %load_initial121 = load double, double* %scevgep120, align 8
  %load_initial124 = load double, double* %scevgep123, align 8
  br label %132

._crit_edge35.us:                                 ; preds = %.lr.ph34.us.new
  %indvar.next105 = add nuw nsw i64 %indvar104, 1
  %exitcond132 = icmp eq i64 %indvar.next105, 998
  br i1 %exitcond132, label %._crit_edge40, label %.lver.check118

.lr.ph34.us.new:                                  ; preds = %._crit_edge29.us, %.lr.ph34.us.new
  %indvars.iv72 = phi i64 [ %indvars.iv.next73.1, %.lr.ph34.us.new ], [ 998, %._crit_edge29.us ]
  %114 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv72
  %115 = load double, double* %114, align 8
  %116 = or i64 %indvars.iv72, 1
  %117 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 %116
  %118 = load double, double* %117, align 8
  %119 = fmul double %115, %118
  %120 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv72
  %121 = load double, double* %120, align 8
  %122 = fadd double %119, %121
  %123 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 %indvars.iv72
  store double %122, double* %123, align 8
  %indvars.iv.next73 = add nsw i64 %indvars.iv72, -1
  %124 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv.next73
  %125 = load double, double* %124, align 8
  %126 = fmul double %125, %122
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv.next73
  %128 = load double, double* %127, align 8
  %129 = fadd double %126, %128
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 %indvars.iv.next73
  store double %129, double* %130, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, -2
  %131 = icmp sgt i64 %indvars.iv.next73, 1
  br i1 %131, label %.lr.ph34.us.new, label %._crit_edge35.us

; <label>:132:                                    ; preds = %132, %.ph119
  %store_forwarded125 = phi double [ %load_initial124, %.ph119 ], [ %150, %132 ]
  %store_forwarded122 = phi double [ %load_initial121, %.ph119 ], [ %135, %132 ]
  %indvars.iv70 = phi i64 [ 1, %.ph119 ], [ %indvars.iv.next71, %132 ]
  %133 = fmul double %store_forwarded122, 0xC08F400000000001
  %134 = fadd double %133, 0x409F440000000001
  %135 = fdiv double 0x408F400000000001, %134
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv70
  store double %135, double* %136, align 8
  %137 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %88, i64 %indvars.iv70
  %138 = load double, double* %137, align 8
  %139 = fmul double %138, 0xC09F400000000001
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv74, i64 %indvars.iv70
  %141 = load double, double* %140, align 8
  %142 = fmul double %141, 0xC0AF3E0000000001
  %143 = fsub double %142, %139
  %144 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %89, i64 %indvars.iv70
  %145 = load double, double* %144, align 8
  %146 = fmul double %145, 0xC09F400000000001
  %147 = fsub double %143, %146
  %148 = fmul double %store_forwarded125, 0xC08F400000000001
  %149 = fsub double %147, %148
  %150 = fdiv double %149, %134
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv70
  store double %150, double* %151, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next71, 999
  br i1 %exitcond130, label %._crit_edge29.us.loopexit126, label %132

._crit_edge29.us.loopexit:                        ; preds = %.ph119.lver.orig
  br label %._crit_edge29.us

._crit_edge29.us.loopexit126:                     ; preds = %132
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us.loopexit126, %._crit_edge29.us.loopexit
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv74, i64 999
  store double 1.000000e+00, double* %152, align 8
  br label %.lr.ph34.us.new

._crit_edge40:                                    ; preds = %._crit_edge35.us
  %153 = add nuw nsw i32 %6, 1
  %exitcond133 = icmp eq i32 %153, 501
  br i1 %exitcond133, label %._crit_edge45, label %.preheader8

._crit_edge45:                                    ; preds = %._crit_edge40
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge3.us, %.preheader.lr.ph
  %indvars.iv12 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next13, %._crit_edge3.us ]
  %6 = mul nuw nsw i64 %indvars.iv12, 1000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %8 = add nuw nsw i64 %6, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %._crit_edge3.us, label %7

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond14, label %._crit_edge5, label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
